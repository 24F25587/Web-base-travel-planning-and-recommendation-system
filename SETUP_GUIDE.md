# Travel Planning System — Setup Guide

## What you need installed
| Tool | Download |
|------|----------|
| Node.js (v18+) | https://nodejs.org |
| MySQL (v8+) | https://dev.mysql.com/downloads/ |

---

## Step 1 — Set up the database

1. Open **MySQL Workbench** (or your terminal).
2. Run the SQL file:
   - In MySQL Workbench: File → Open SQL Script → select `database.sql` → click the ⚡ Run button.
   - OR in terminal:
     ```
     mysql -u root -p < database.sql
     ```
3. You should now have a database called `travel_system` with three tables:
   - `users`
   - `feedback`
   - `trip_reviews`

---

## Step 2 — Set up the project folder

Copy ALL these files into **one folder**:

```
your-project/
├── server.js
├── package.json
├── index.html        ← login page
├── register.html
├── homepage.html
├── feed.html
├── feedback.html
└── success.html
```

---

## Step 3 — Edit your MySQL password in server.js

Open `server.js` and find this section (around line 22):

```js
const db = mysql.createPool({
  host:     'localhost',
  user:     'root',      // your MySQL username
  password: '',          // ← PUT YOUR MYSQL PASSWORD HERE
  database: 'travel_system',
```

Save the file.

---

## Step 4 — Install Node.js packages

Open a terminal **inside your project folder** and run:

```bash
npm install
```

This installs Express, MySQL2, and bcrypt.

---

## Step 5 — Start the server

```bash
node server.js
```

You should see:
```
✅  Server running at http://localhost:3000
   Login page  →  http://localhost:3000/
   Homepage    →  http://localhost:3000/homepage.html
```

---

## Step 6 — Open the website

Open your browser and go to:
```
http://localhost:3000
```

---

## How each page connects to the database

| Page | What it does | Database table |
|------|-------------|----------------|
| `index.html` | Login form | reads `users` |
| `register.html` | Create account | writes to `users` |
| `feed.html` | Submit trip review with star rating | writes to `trip_reviews` |
| `feedback.html` | Send a message / feedback | writes to `feedback` |

---

## Useful test URLs (in browser or Postman)

| URL | What it shows |
|-----|--------------|
| `http://localhost:3000/api/users` | All registered users |
| `http://localhost:3000/api/reviews` | All trip reviews |
| `http://localhost:3000/api/feedbacks` | All feedback messages |

---

## To keep the server running while you code (auto-restart)

```bash
npm run dev
```

(Uses nodemon — restarts automatically when you save a file.)

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `Access denied for user 'root'` | Wrong password in server.js — double-check Step 3 |
| `Unknown database 'travel_system'` | You didn't run database.sql yet — redo Step 1 |
| `Cannot find module 'express'` | Run `npm install` again (Step 4) |
| `Port 3000 already in use` | Change `const PORT = 3000` in server.js to `3001` |
| Page loads but form gives network error | Make sure server.js is running and you opened via `http://localhost:3000`, NOT by double-clicking the HTML file |
