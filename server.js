// ============================================================
//  server.js  —  Travel Planning & Recommendation System
//  Stack: Node.js + Express + MySQL2 + bcrypt
// ============================================================

const express  = require('express');
const mysql    = require('mysql2/promise');
const bcrypt = require('bcryptjs');
const path     = require('path');

const app  = express();
const PORT = 3000;

// ── Middleware ──────────────────────────────────────────────
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve ALL your HTML files from the project root folder
app.use(express.static(path.join(__dirname)));

// ── MySQL Connection Pool ───────────────────────────────────
const db = mysql.createPool({
  host:     'localhost',
  user:     'root',
  password: 'Database2026::;',   // ← your MySQL root password
  database: 'travel_system',
  waitForConnections: true,
  connectionLimit: 10
});

// ── Helper ──────────────────────────────────────────────────
async function query(sql, params) {
  const [rows] = await db.execute(sql, params);
  return rows;
}
// ============================================================
//  HOTEL ROUTES
// ============================================================

// GET /api/hotels — Fetch all hotels
app.get('/api/hotels', async (req, res) => {
  try {
    const hotels = await query('SELECT * FROM hotels ORDER BY name ASC', []);
    res.json({ success: true, hotels });
  } catch (err) {
    console.error('Hotel fetch error:', err);
    res.status(500).json({ success: false, message: 'Server error fetching hotels.' });
  }
});

// GET /api/hotels/search?destination=Paris — Search hotels by city name
app.get('/api/hotels/search', async (req, res) => {
  try {
    const { destination } = req.query;
    // Joining with destinations table to filter by city name
    const sql = `
      SELECT h.* FROM hotels h
      JOIN destinations d ON h.destination_id = d.id
      WHERE d.city LIKE ?
    `;
    const hotels = await query(sql, [`%${destination}%`]);
    res.json({ success: true, hotels });
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error searching hotels.' });
  }
});
// ============================================================
//  AUTH ROUTES
// ============================================================

// POST /api/register
app.post('/api/register', async (req, res) => {
  try {
    const { first_name, last_name, username, email, password } = req.body;

    if (!first_name || !last_name || !username || !email || !password) {
      return res.status(400).json({ success: false, message: 'All fields are required.' });
    }

    const existing = await query(
      'SELECT id FROM users WHERE email = ? OR username = ?',
      [email, username]
    );
    if (existing.length > 0) {
      return res.status(409).json({ success: false, message: 'Email or username already exists.' });
    }

    const hash = await bcrypt.hash(password, 10);
    await query(
      'INSERT INTO users (first_name, last_name, username, email, password) VALUES (?, ?, ?, ?, ?)',
      [first_name, last_name, username, email, hash]
    );

    res.json({ success: true, message: 'Account created successfully!' });
  } catch (err) {
    console.error('Register error:', err);
    res.status(500).json({ success: false, message: 'Server error during registration.' });
  }
});

// POST /api/login
app.post('/api/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return res.status(400).json({ success: false, message: 'Email and password are required.' });
    }

    const users = await query('SELECT * FROM users WHERE email = ?', [email]);
    if (users.length === 0) {
      return res.status(401).json({ success: false, message: 'Invalid email or password.' });
    }

    const user = users[0];
    const match = await bcrypt.compare(password, user.password);
    if (!match) {
      return res.status(401).json({ success: false, message: 'Invalid email or password.' });
    }

    res.json({
      success: true,
      message: `Welcome back, ${user.first_name}!`,
      user: { id: user.id, firstName: user.first_name, username: user.username }
    });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ success: false, message: 'Server error during login.' });
  }
});

// ============================================================
//  FEEDBACK ROUTE  (feed.html — trip reviews with star rating)
//  Database table: feedback(id, user_id, subject, message, created_at)
//  We store: subject = destination, message = review comments
// ============================================================

app.post('/api/feedback', async (req, res) => {
  try {
    const { name, destination, rating, comments } = req.body;

    if (!name || !destination || !rating || !comments) {
      return res.status(400).json({ success: false, message: 'All fields are required.' });
    }
    if (rating < 1 || rating > 5) {
      return res.status(400).json({ success: false, message: 'Rating must be between 1 and 5.' });
    }

    // Save into trip_reviews using the actual DB columns
    await query(
      'INSERT INTO trip_reviews (user_id, destination, rating, review_text) VALUES (NULL, ?, ?, ?)',
      [destination, parseInt(rating), `[${name}] ${comments}`]
    );

    res.json({ success: true, message: 'Thank you! Your travel review has been saved.' });
  } catch (err) {
    console.error('Feedback/review error:', err);
    res.status(500).json({ success: false, message: 'Server error saving review.' });
  }
});

// ============================================================
//  TRIP REVIEW ROUTE  (alternative endpoint)
// ============================================================

app.post('/api/trip-review', async (req, res) => {
  try {
    const { name, destination, rating, comments } = req.body;

    if (!name || !destination || !rating || !comments) {
      return res.status(400).json({ success: false, message: 'All fields are required.' });
    }

    await query(
      'INSERT INTO trip_reviews (user_id, destination, rating, review_text) VALUES (NULL, ?, ?, ?)',
      [destination, parseInt(rating), `[${name}] ${comments}`]
    );

    res.json({ success: true, message: 'Thank you! Your travel review has been saved.' });
  } catch (err) {
    console.error('Trip review error:', err);
    res.status(500).json({ success: false, message: 'Server error saving review.' });
  }
});

// ============================================================
//  HALAL RESTAURANTS ROUTE
// ============================================================

// GET /api/halal?lat=23.58&lon=58.38&radius=8000
app.get('/api/halal', async (req, res) => {
  try {
    const { lat, lon, radius = 8000 } = req.query;
    if (!lat || !lon) return res.status(400).json({ success: false, message: 'lat and lon required.' });

    // Find restaurants within radius using Haversine approximation
    const rows = await query(`
      SELECT *, (
        6371000 * ACOS(
          COS(RADIANS(?)) * COS(RADIANS(latitude)) *
          COS(RADIANS(longitude) - RADIANS(?)) +
          SIN(RADIANS(?)) * SIN(RADIANS(latitude))
        )
      ) AS distance
      FROM halal_restaurants
      HAVING distance <= ?
      ORDER BY distance ASC
      LIMIT 200
    `, [lat, lon, lat, parseInt(radius)]);

    res.json({ success: true, restaurants: rows });
  } catch (err) {
    console.error('Halal fetch error:', err);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// GET /api/halal/city?city=Dubai  — search by city name
app.get('/api/halal/city', async (req, res) => {
  try {
    const { city } = req.query;
    if (!city) return res.status(400).json({ success: false, message: 'city required.' });
    const rows = await query(
      'SELECT * FROM halal_restaurants WHERE city LIKE ? ORDER BY halal_certified DESC, name ASC LIMIT 200',
      [`%${city}%`]
    );
    res.json({ success: true, restaurants: rows });
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error.' });
  }
});

// GET /api/halal/stats
app.get('/api/halal/stats', async (_, res) => {
  try {
    const [[total]]    = await db.execute('SELECT COUNT(*) as total FROM halal_restaurants');
    const [[certified]]= await db.execute('SELECT COUNT(*) as total FROM halal_restaurants WHERE halal_certified = 1');
    const [cities]     = await db.execute('SELECT city, country, COUNT(*) as count FROM halal_restaurants GROUP BY city, country ORDER BY count DESC LIMIT 20');
    res.json({ total: total.total, certified: certified.total, topCities: cities });
  } catch (err) {
    res.status(500).json({ success: false, message: 'Stats error.' });
  }
});

// ============================================================
//  ITINERARY ROUTES
// ============================================================

// GET /api/itinerary?country=Japan&category=Food+%26+Cuisine&days=3
// Returns stored itinerary from DB, or falls back to live AI generation
app.get('/api/itinerary', async (req, res) => {
  try {
    const { country, category, days } = req.query;
    if (!country || !category || !days) {
      return res.status(400).json({ success: false, message: 'country, category and days are required.' });
    }

    const rows = await query(
      'SELECT itinerary FROM itineraries WHERE country = ? AND category = ? AND days = ?',
      [country, category, parseInt(days)]
    );

    if (rows.length > 0) {
      // Serve from database
      return res.json({ success: true, source: 'db', itinerary: JSON.parse(rows[0].itinerary) });
    }

    // Not in DB yet — generate live and save for next time
    res.json({ success: false, source: 'miss', message: 'Not found in database. Please generate using the AI directly.' });
  } catch (err) {
    console.error('Itinerary fetch error:', err);
    res.status(500).json({ success: false, message: 'Server error fetching itinerary.' });
  }
});

// GET /api/itinerary/stats — how many itineraries are stored
app.get('/api/itinerary/stats', async (_, res) => {
  try {
    const [total]      = await query('SELECT COUNT(*) as total FROM itineraries', []);
    const [byCategory] = await query('SELECT category, COUNT(*) as count FROM itineraries GROUP BY category', []);
    const [byDays]     = await query('SELECT days, COUNT(*) as count FROM itineraries GROUP BY days ORDER BY days', []);
    res.json({ total: total[0]?.total || 0, byCategory, byDays });
  } catch (err) {
    res.status(500).json({ success: false, message: 'Stats error.' });
  }
});

// ============================================================
//  READ ROUTES  (for admin / testing)
// ============================================================

app.get('/api/reviews',   async (_, res) => res.json(await query('SELECT * FROM trip_reviews ORDER BY created_at DESC', [])));
app.get('/api/feedbacks', async (_, res) => res.json(await query('SELECT * FROM feedback ORDER BY created_at DESC', [])));
app.get('/api/users',     async (_, res) => res.json(await query('SELECT id, first_name, last_name, username, email, created_at FROM users', [])));

// ── Default route — serve login page ───────────────────────
app.get('/', (_, res) => res.sendFile(path.join(__dirname, 'index.html')));

// ── Start ───────────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`\n✅  Server running at http://localhost:${PORT}`);
  console.log(`   Login page  →  http://localhost:${PORT}/`);
  console.log(`   Homepage    →  http://localhost:${PORT}/homepage.html\n`);
});
