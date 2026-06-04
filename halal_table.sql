-- ==========================================
-- Halal Restaurants Table
-- ==========================================
USE travel_system;

CREATE TABLE IF NOT EXISTS halal_restaurants (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    name                VARCHAR(255) NOT NULL,
    cuisine             VARCHAR(100),
    address             VARCHAR(500),
    city                VARCHAR(100),
    country             VARCHAR(100),
    latitude            DECIMAL(10, 7) NOT NULL,
    longitude           DECIMAL(10, 7) NOT NULL,
    phone               VARCHAR(50),
    opening_hours       VARCHAR(500),
    halal_certified     TINYINT(1) DEFAULT 0,
    certificate_issuer  VARCHAR(255),
    certificate_expiry  DATE,
    osm_id              BIGINT UNIQUE,           -- OpenStreetMap ID to avoid duplicates
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_city (city),
    INDEX idx_country (country),
    INDEX idx_coords (latitude, longitude),
    INDEX idx_certified (halal_certified)
);
