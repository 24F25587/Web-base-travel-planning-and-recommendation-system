// ============================================================
//  fetch_halal_restaurants.js
//  Fetches halal restaurants from OpenStreetMap (Overpass API)
//  for major cities worldwide and saves them to MySQL.
//
//  Usage:
//    node fetch_halal_restaurants.js
//  Re-running is safe — duplicates are skipped via osm_id.
// ============================================================

const mysql = require('mysql2/promise');
const https = require('https');

const DB_CONFIG = {
  host: 'localhost',
  user: 'root',
  password: 'Database2026::;',
  database: 'travel_system',
  waitForConnections: true,
  connectionLimit: 5
};

// Major cities worldwide with coordinates
const CITIES = [
  { name: 'Muscat', country: 'Oman', lat: 23.5880, lon: 58.3829 },
  { name: 'Dubai', country: 'UAE', lat: 25.2048, lon: 55.2708 },
  { name: 'Abu Dhabi', country: 'UAE', lat: 24.4539, lon: 54.3773 },
  { name: 'Riyadh', country: 'Saudi Arabia', lat: 24.7136, lon: 46.6753 },
  { name: 'Jeddah', country: 'Saudi Arabia', lat: 21.4858, lon: 39.1925 },
  { name: 'Istanbul', country: 'Turkey', lat: 41.0082, lon: 28.9784 },
  { name: 'Kuala Lumpur', country: 'Malaysia', lat: 3.1390, lon: 101.6869 },
  { name: 'Jakarta', country: 'Indonesia', lat: -6.2088, lon: 106.8456 },
  { name: 'Karachi', country: 'Pakistan', lat: 24.8607, lon: 67.0011 },
  { name: 'Lahore', country: 'Pakistan', lat: 31.5204, lon: 74.3587 },
  { name: 'Cairo', country: 'Egypt', lat: 30.0444, lon: 31.2357 },
  { name: 'Casablanca', country: 'Morocco', lat: 33.5731, lon: -7.5898 },
  { name: 'London', country: 'UK', lat: 51.5074, lon: -0.1278 },
  { name: 'Paris', country: 'France', lat: 48.8566, lon: 2.3522 },
  { name: 'Berlin', country: 'Germany', lat: 52.5200, lon: 13.4050 },
  { name: 'New York', country: 'USA', lat: 40.7128, lon: -74.0060 },
  { name: 'Toronto', country: 'Canada', lat: 43.6532, lon: -79.3832 },
  { name: 'Singapore', country: 'Singapore', lat: 1.3521, lon: 103.8198 },
  { name: 'Dhaka', country: 'Bangladesh', lat: 23.8103, lon: 90.4125 },
  { name: 'Tehran', country: 'Iran', lat: 35.6892, lon: 51.3890 },
  { name: 'Amman', country: 'Jordan', lat: 31.9454, lon: 35.9284 },
  { name: 'Beirut', country: 'Lebanon', lat: 33.8938, lon: 35.5018 },
  { name: 'Doha', country: 'Qatar', lat: 25.2854, lon: 51.5310 },
  { name: 'Kuwait City', country: 'Kuwait', lat: 29.3759, lon: 47.9774 },
  { name: 'Manama', country: 'Bahrain', lat: 26.2285, lon: 50.5860 },
  { name: 'Tunis', country: 'Tunisia', lat: 36.8065, lon: 10.1815 },
  { name: 'Algiers', country: 'Algeria', lat: 36.7372, lon: 3.0865 },
  { name: 'Lagos', country: 'Nigeria', lat: 6.5244, lon: 3.3792 },
  { name: 'Nairobi', country: 'Kenya', lat: -1.2921, lon: 36.8219 },
  { name: 'Dakar', country: 'Senegal', lat: 14.7167, lon: -17.4677 },
  { name: 'Islamabad', country: 'Pakistan', lat: 33.6844, lon: 73.0479 },
  { name: 'Mumbai', country: 'India', lat: 19.0760, lon: 72.8777 },
  { name: 'Delhi', country: 'India', lat: 28.6139, lon: 77.2090 },
  { name: 'Sydney', country: 'Australia', lat: -33.8688, lon: 151.2093 },
  { name: 'Melbourne', country: 'Australia', lat: -37.8136, lon: 144.9631 },
  { name: 'Amsterdam', country: 'Netherlands', lat: 52.3676, lon: 4.9041 },
  { name: 'Brussels', country: 'Belgium', lat: 50.8503, lon: 4.3517 },
  { name: 'Stockholm', country: 'Sweden', lat: 59.3293, lon: 18.0686 },
  { name: 'Oslo', country: 'Norway', lat: 59.9139, lon: 10.7522 },
  { name: 'Copenhagen', country: 'Denmark', lat: 55.6761, lon: 12.5683 },
];

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

function overpassFetch(query) {
  return new Promise((resolve, reject) => {
    const body = query;
    const options = {
      hostname: 'overpass-api.de',
      path: '/api/interpreter',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(body)
      }
    };
    const req = https.request(options, res => {
      let data = '';
      res.on('data', c => data += c);
      res.on('end', () => {
        try { resolve(JSON.parse(data)); }
        catch(e) { reject(e); }
      });
    });
    req.on('error', reject);
    req.write(body);
    req.end();
  });
}

function parseOpeningHours(tags) {
  return tags.opening_hours || tags['opening_hours:covid19'] || null;
}

function isHalalCertified(tags) {
  const text = JSON.stringify(tags).toLowerCase();
  return text.includes('halal_certified') || 
         text.includes('certification') ||
         text.includes('certificate') ? 1 : 0;
}

function getCertIssuer(tags) {
  return tags['halal:certification_body'] || 
         tags['certification:halal'] || 
         tags['halal_certifier'] || null;
}

async function main() {
  console.log('\n🕌  Halal Restaurant Database Builder\n');
  const db = await mysql.createPool(DB_CONFIG);
  
  let totalSaved = 0;
  let totalSkipped = 0;
  let totalFailed = 0;

  for (let i = 0; i < CITIES.length; i++) {
    const city = CITIES[i];
    process.stdout.write(`\n[${i+1}/${CITIES.length}] 📍 ${city.name}, ${city.country}... `);

    const query = `[out:json][timeout:30];
(
  node["amenity"="restaurant"]["diet:halal"~"yes|only",i](around:8000,${city.lat},${city.lon});
  node["amenity"="restaurant"]["cuisine"~"halal|arab|arabic|middle_eastern|turkish|pakistani|bangladeshi|malaysian|indonesian",i](around:8000,${city.lat},${city.lon});
  node["amenity"="restaurant"]["halal"="yes"](around:8000,${city.lat},${city.lon});
  way["amenity"="restaurant"]["diet:halal"~"yes|only",i](around:8000,${city.lat},${city.lon});
  way["amenity"="restaurant"]["halal"="yes"](around:8000,${city.lat},${city.lon});
);
out center tags;`;

    try {
      const data = await overpassFetch(query);
      const elements = data.elements || [];
      let citySaved = 0;

      for (const el of elements) {
        const tags = el.tags || {};
        const lat = el.lat || el.center?.lat;
        const lon = el.lon || el.center?.lon;
        if (!lat || !lon) continue;

        const name = tags.name || tags['name:en'] || 'Unnamed Restaurant';
        const cuisine = tags.cuisine || tags['diet:halal'] ? (tags.cuisine || 'Halal') : 'Restaurant';
        const address = [tags['addr:street'], tags['addr:housenumber'], tags['addr:suburb']]
          .filter(Boolean).join(', ') || null;
        const phone = tags.phone || tags['contact:phone'] || null;
        const opening_hours = parseOpeningHours(tags);
        const halal_certified = isHalalCertified(tags);
        const cert_issuer = getCertIssuer(tags);
        const osm_id = el.id;

        try {
          await db.execute(
            `INSERT IGNORE INTO halal_restaurants 
             (name, cuisine, address, city, country, latitude, longitude, phone, opening_hours, halal_certified, certificate_issuer, osm_id)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [name, cuisine, address, city.name, city.country, lat, lon, phone, opening_hours, halal_certified, cert_issuer, osm_id]
          );
          citySaved++;
          totalSaved++;
        } catch(e) {
          if (e.code === 'ER_DUP_ENTRY') totalSkipped++;
          else { totalFailed++; }
        }
      }

      console.log(`✅ ${elements.length} found, ${citySaved} saved`);
    } catch(err) {
      totalFailed++;
      console.log(`❌ Failed: ${err.message}`);
    }

    await sleep(2000); // respectful delay for Overpass API
  }

  console.log(`\n\n✅  Done!`);
  console.log(`   Saved:   ${totalSaved}`);
  console.log(`   Skipped: ${totalSkipped}`);
  console.log(`   Failed:  ${totalFailed}\n`);

  await db.end();
}

main().catch(err => {
  console.error('\n❌ Fatal:', err.message);
  process.exit(1);
});
