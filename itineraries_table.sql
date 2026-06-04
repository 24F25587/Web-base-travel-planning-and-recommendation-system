-- ==========================================
-- Add itineraries table to travel_system
-- ==========================================
USE travel_system;

CREATE TABLE IF NOT EXISTS itineraries (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    country      VARCHAR(255) NOT NULL,
    category     VARCHAR(100) NOT NULL,
    days         INT NOT NULL,
    itinerary    LONGTEXT NOT NULL,   -- JSON array stored as text
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_itinerary (country, category, days)
);
