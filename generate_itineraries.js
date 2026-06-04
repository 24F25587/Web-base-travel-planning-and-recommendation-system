// ============================================================
//  generate_itineraries.js  (Gemini Free API version)
//  Pre-generates itineraries for all countries × 6 categories
//  and saves them to MySQL.
//
//  Usage:
//    node generate_itineraries.js            (3-day itineraries)
//    node generate_itineraries.js --days 5
//    node generate_itineraries.js --days 7
//
//  Get free API key: https://aistudio.google.com → Get API Key
//  Then run:
//    set GEMINI_API_KEY=your_key_here   (Windows PowerShell)
//    node generate_itineraries.js --days 3
// ============================================================

const mysql = require('mysql2/promise');
const https = require('https');

// ── Config ──────────────────────────────────────────────────
const DB_CONFIG = {
  host:     'localhost',
  user:     'root',
  password: 'Database2026::;',
  database: 'travel_system',
  waitForConnections: true,
  connectionLimit: 5
};

const CATEGORIES = [
  'Cultural & History',
  'Adventure & Nature',
  'Food & Cuisine',
  'Relaxation & Beach',
  'Shopping & City Life',
  'Family Friendly'
];

const DAYS = parseInt(process.argv[process.argv.indexOf('--days') + 1]) || 3;
const DELAY_MS = 1000; // Gemini free tier: 15 requests/min, so 1s delay is safe

// ── API Key ─────────────────────────────────────────────────
const GEMINI_API_KEY = 'AQ.Ab8RN6L4wKCG5-2qsQNh-_aROVIwZfd2UOOrnp1PCC7JPqUgjQ';
if (!GEMINI_API_KEY || GEMINI_API_KEY === 'YOUR_GEMINI_KEY_HERE') {
  console.error('\n❌  Missing Gemini API key!');
  console.error('   1. Go to https://aistudio.google.com and click "Get API Key"');
  console.error('   2. Then run:');
  console.error('      Windows:   set GEMINI_API_KEY=your_key_here');
  console.error('      Mac/Linux: export GEMINI_API_KEY=your_key_here');
  console.error('   3. Run the script again\n');
  process.exit(1);
}

// ── Helpers ─────────────────────────────────────────────────
function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

function callGemini(prompt) {
  return new Promise((resolve, reject) => {
    const body = JSON.stringify({
      contents: [{ parts: [{ text: prompt }] }],
      generationConfig: {
        temperature: 0.7,
        maxOutputTokens: 1200
      }
    });

    const options = {
      hostname: 'generativelanguage.googleapis.com',
      path: `/v1beta/models/gemini-2.0-flash:generateContent?key=${GEMINI_API_KEY}`,
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(body)
      }
    };

    const req = https.request(options, res => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const parsed = JSON.parse(data);
          resolve(parsed);
        } catch(e) { reject(e); }
      });
    });

    req.on('error', reject);
    req.write(body);
    req.end();
  });
}

async function fetchCountries() {
  return new Promise((resolve, reject) => {
    https.get('https://restcountries.com/v3.1/all?fields=name,cca2', res => {
      let data = '';
      res.on('data', c => data += c);
      res.on('end', () => {
        try { resolve(JSON.parse(data)); }
        catch(e) { reject(e); }
      });
    }).on('error', reject);
  });
}

// ── Main ────────────────────────────────────────────────────
async function main() {
  console.log(`\n🌍  Starting itinerary generation for ${DAYS}-day trips (Gemini Free API)\n`);

  const db = await mysql.createPool(DB_CONFIG);

  console.log('📡  Fetching country list...');
  const countries = await fetchCountries();
  const countryNames = countries.map(c => c.name.common).sort();
  console.log(`✅  ${countryNames.length} countries loaded\n`);

  const total = countryNames.length * CATEGORIES.length;
  let done = 0;
  let skipped = 0;
  let failed = 0;

  for (const country of countryNames) {
    for (const category of CATEGORIES) {
      done++;
      const pct = Math.round((done / total) * 100);

      // Check if already exists
      const [existing] = await db.execute(
        'SELECT id FROM itineraries WHERE country = ? AND category = ? AND days = ?',
        [country, category, DAYS]
      );

      if (existing.length > 0) {
        skipped++;
        process.stdout.write(`\r[${pct}%] ${done}/${total} — Skipped: ${skipped} | Failed: ${failed} | Skipping: ${country} / ${category}        `);
        continue;
      }

      const prompt = `Create a ${DAYS}-day travel itinerary for ${country} focused on: ${category}.
Return ONLY a valid JSON array. No markdown, no backticks, no explanation. Format exactly:
[{"day":1,"title":"Day 1 – Place Name","places":["Place: short description","Place: short description","Place: short description"]}]
Include 3-5 places per day. Tailor every suggestion to the "${category}" theme.`;

      try {
        const response = await callGemini(prompt);

        // Surface API-level errors
        if (response.error) {
          throw new Error(`API error: ${response.error.code} — ${response.error.message}`);
        }

        const text = response.candidates?.[0]?.content?.parts?.[0]?.text || '';
        const clean = text.replace(/```json|```/g, '').trim();

        // Validate JSON
        JSON.parse(clean);

        await db.execute(
          'INSERT IGNORE INTO itineraries (country, category, days, itinerary) VALUES (?, ?, ?, ?)',
          [country, category, DAYS, clean]
        );

        process.stdout.write(`\r[${pct}%] ${done}/${total} — Skipped: ${skipped} | Failed: ${failed} | Saved: ${country} / ${category}        `);

      } catch(err) {
        failed++;
        const errMsg = err.message || String(err);
        process.stdout.write(`\r[${pct}%] ${done}/${total} — Skipped: ${skipped} | Failed: ${failed} | FAILED: ${country} / ${category} — ${errMsg}        `);
      }

      await sleep(DELAY_MS);
    }
  }

  console.log(`\n\n✅  Done! Generated ${done - skipped - failed} new itineraries.`);
  console.log(`   Skipped (already existed): ${skipped}`);
  console.log(`   Failed: ${failed}`);
  console.log(`\n   Run again with --days 5 or --days 7 to generate more lengths.\n`);

  await db.end();
}

main().catch(err => {
  console.error('\n❌  Fatal error:', err.message);
  process.exit(1);
});
