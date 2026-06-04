-- ============================================================
--  hotels_seed.sql — 500 Worldwide Hotels
--  Run AFTER hotels.sql (schema must exist first)
--  Covers: Europe, Middle East, Asia, Americas, Africa, Oceania
-- ============================================================

-- ── Step 1: Extend the hotels table with UI columns ─────────
-- (Skip this block if you already ran it)
ALTER TABLE hotels
  ADD COLUMN   title        VARCHAR(255),
  ADD COLUMN  image        VARCHAR(500),
  ADD COLUMN  category     VARCHAR(100),
  ADD COLUMN  rating       DECIMAL(3,1),
  ADD COLUMN  price        INT,
  ADD COLUMN  badge        VARCHAR(100),
  ADD COLUMN  description  TEXT,
  ADD COLUMN  features     JSON;

-- ── Step 2a: Original 34 Destinations ──────────────────────
INSERT IGNORE INTO destinations (city, country) VALUES
  ('Paris',          'France'),
  ('London',         'UK'),
  ('Barcelona',      'Spain'),
  ('Rome',           'Italy'),
  ('Venice',         'Italy'),
  ('Lucerne',        'Switzerland'),
  ('Dubai',          'UAE'),
  ('Riyadh',         'Saudi Arabia'),
  ('Amman',          'Jordan'),
  ('Muscat',         'Oman'),
  ('Zighy Bay',      'Oman'),
  ('Tokyo',          'Japan'),
  ('Bangkok',        'Thailand'),
  ('Chiang Rai',     'Thailand'),
  ('Singapore',      'Singapore'),
  ('Hong Kong',      'China'),
  ('Mumbai',         'India'),
  ('Ubud',           'Indonesia'),
  ('Hanoi',          'Vietnam'),
  ('Tetiaroa',       'French Polynesia'),
  ('New York',       'USA'),
  ('Los Angeles',    'USA'),
  ('Miami',          'USA'),
  ('Canyon Point',   'USA'),
  ('Tulum',          'Mexico'),
  ('Rio de Janeiro', 'Brazil'),
  ('Torres del Paine','Chile'),
  ('Buenos Aires',   'Argentina'),
  ('Kruger',         'South Africa'),
  ('Ngorongoro',     'Tanzania'),
  ('Serengeti',      'Tanzania'),
  ('Masai Mara',     'Kenya'),
  ('Marrakech',      'Morocco'),
  ('Ain Sokhna',     'Egypt');


-- EUROPE ─────────────────────────────────────────────────────

-- Paris
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Paris'),
  'Hôtel de Crillon', 'Place de la Concorde, 75008 Paris', 5, '$700-$1200',
  48.8656, 2.3212,
  'Palace hotel on Place de la Concorde',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Iconic Cities', 4.97, 850, 'Luxury',
  'One of Paris''s most storied palace hotels facing the Concorde',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-2-line|Fine Dining','ri-swimming-pool-line|Pool','ri-service-line|Concierge','ri-car-line|Valet Parking','ri-shield-check-line|24h Security')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Paris'),
  'Le Marais Boutique', '12 Rue de Bretagne, 75003 Paris', 4, '$200-$380',
  48.8637, 2.3590,
  'Historic apartment in Le Marais',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Iconic Cities', 4.92, 290, 'Guest Favourite',
  'Charming Haussmann-style flat steps from the Pompidou Centre',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-line|Breakfast Included','ri-map-pin-line|Prime Location','ri-building-line|Historic Building')
);

-- London
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='London'),
  'The Savoy', 'Strand, London WC2R 0EU', 5, '$600-$1100',
  51.5104, -0.1204,
  'Legendary Thames-side luxury hotel',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Iconic Cities', 4.95, 780, 'Luxury',
  'Legendary Thames-side hotel since 1889 — art deco grandeur in the West End',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-swimming-pool-line|Indoor Pool','ri-restaurant-2-line|Fine Dining','ri-service-line|Butler Service','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='London'),
  'citizenM Tower of London', 40 Trinity Square EC3N 4DJ', 4, '$150-$240',
  51.5101, -0.0756,
  'Modern design hotel near Tower Bridge',
  'https://images.unsplash.com/photo-1445991842772-097fea258e7b?w=800',
  'Iconic Cities', 4.6, 195, 'Best Value',
  'Compact and clever rooms with panoramic views of the Tower of London',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-24-hours-line|24h Bar','ri-map-pin-line|City Centre')
);

-- Barcelona
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Barcelona'),
  'Hotel Arts Barcelona', 'Carrer de la Marina 19-21, 08005', 5, '$400-$700',
  41.3893, 2.1974,
  'Beachfront tower in the Olympic Village',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Coastal', 4.88, 520, 'Luxury',
  'Ritz-Carlton seafront skyscraper overlooking Barceloneta beach',
  JSON_ARRAY('ri-swimming-pool-line|Infinity Pool','ri-wifi-line|Free WiFi','ri-restaurant-2-line|Rooftop Bar','ri-spa-line|Spa','ri-beach-line|Beach Access')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Barcelona'),
  'Casa Camper Barcelona', 'Carrer d''Elisabets 11, 08001', 4, '$180-$290',
  41.3818, 2.1679,
  'Quirky design hotel in El Raval',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Cultural', 4.7, 240, NULL,
  'Camper shoes'' hotel concept — innovative rooms and a 24h free snack bar',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-line|Free Snack Bar','ri-map-pin-line|Gothic Quarter')
);

-- Rome
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rome'),
  'Rocco Forte Hotel de Russie', 'Via del Babuino 9, 00187', 5, '$500-$900',
  41.9087, 12.4764,
  'Secret garden retreat near Piazza del Popolo',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Cultural', 4.93, 650, 'Luxury',
  'Stunning terraced garden steps from Piazza del Popolo and the Spanish Steps',
  JSON_ARRAY('ri-spa-line|Wellness Spa','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi','ri-garden-line|Secret Garden','ri-service-line|Concierge')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rome'),
  'Generator Rome', 'Via Palestro 34, 00185', 3, '$70-$120',
  41.9009, 12.5024,
  'Vibrant social hotel near Termini',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Cultural', 4.3, 85, 'Best Value',
  'Cool, design-forward hostel-hotel with rooftop bar near Termini station',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar','ri-community-line|Social Spaces')
);

-- Venice
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Venice'),
  'Hotel Danieli', 'Riva degli Schiavoni 4196, 30122', 5, '$700-$1300',
  45.4345, 12.3408,
  'Gothic palazzo on the Grand Canal',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Cultural', 4.91, 900, 'Luxury',
  'Historic 14th-century palazzo with direct lagoon views beside the Doge''s Palace',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-2-line|Rooftop Restaurant','ri-service-line|Butler Service','ri-ship-line|Private Water Taxi')
);

-- Switzerland
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lucerne'),
  'Bürgenstock Resort', 'Bürgenstock 6363, Nidwalden', 5, '$600-$950',
  47.0022, 8.3905,
  'Alpine resort above Lake Lucerne',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Nature', 4.9, 720, 'Luxury',
  'Clifftop resort with sweeping Alpine views and award-winning spa',
  JSON_ARRAY('ri-spa-line|Alpine Spa','ri-swimming-pool-line|Infinity Pool','ri-restaurant-2-line|Fine Dining','ri-mountain-line|Hiking Trails','ri-wifi-line|Free WiFi')
);

-- MIDDLE EAST ────────────────────────────────────────────────

-- Dubai
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubai'),
  'Burj Al Arab', 'Jumeirah Beach Rd, Dubai', 5, '$1500-$3000',
  25.1412, 55.1853,
  'World''s most iconic sail-shaped hotel',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
  'Coastal', 4.98, 1800, 'Luxury',
  'The world''s only 7-star hotel on its own artificial island in the Arabian Gulf',
  JSON_ARRAY('ri-swimming-pool-line|Private Beach','ri-helicopter-line|Helipad Transfers','ri-restaurant-2-line|Underwater Restaurant','ri-spa-line|Gold Spa','ri-service-line|24h Butler')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubai'),
  'Atlantis The Palm', 'Crescent Rd, The Palm, Dubai', 5, '$500-$900',
  25.1300, 55.1172,
  'Legendary resort on Palm Jumeirah',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Coastal', 4.8, 650, 'Guest Favourite',
  'Iconic resort with Aquaventure waterpark and a private beach on the Palm',
  JSON_ARRAY('ri-water-flash-line|Waterpark Access','ri-beach-line|Private Beach','ri-restaurant-2-line|Multiple Restaurants','ri-swimming-pool-line|Pools','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubai'),
  'Address Downtown', 'Sheikh Mohammed bin Rashid Blvd', 5, '$380-$620',
  25.1956, 55.2796,
  'Tower hotel with Burj Khalifa views',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Iconic Cities', 4.82, 480, NULL,
  'Sleek Downtown hotel with the best Burj Khalifa and Dubai Fountain views',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-swimming-pool-line|Rooftop Pool','ri-restaurant-2-line|Dining','ri-map-pin-line|Dubai Mall Access')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubai'),
  'W Dubai The Palm', 'West Crescent, Palm Jumeirah', 5, '$320-$520',
  25.1178, 55.1390,
  'Bold beachfront design hotel on the Palm',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Coastal', 4.75, 390, NULL,
  'Vivid W Hotels design on the trunk of the Palm with beach club and pool',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-swimming-pool-line|Infinity Pool','ri-wifi-line|Free WiFi','ri-goblet-line|WET Deck Bar')
);

-- Saudi Arabia
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Riyadh'),
  'Four Seasons Riyadh', 'Kingdom Centre Tower, Olaya', 5, '$350-$600',
  24.6898, 46.6886,
  'Opulent urban retreat in Kingdom Tower',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Iconic Cities', 4.9, 420, 'Luxury',
  'Upper floors of the iconic Kingdom Centre skyscraper with city panoramas',
  JSON_ARRAY('ri-spa-line|Full Spa','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi','ri-service-line|Concierge')
);

-- Jordan
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amman'),
  'Amman Rotana', 'Zahran Street, 3rd Circle', 5, '$160-$280',
  31.9615, 35.9211,
  'Sleek business hotel in central Amman',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Iconic Cities', 4.65, 210, NULL,
  'Contemporary tower hotel near embassies and the Rainbow Street cultural strip',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Dining','ri-spa-line|Fitness Centre')
);

-- Oman
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Muscat'),
  'Kempinski Hotel Muscat', 'Ghubra North, Muscat', 5, '$250-$420',
  23.6045, 58.5921,
  'Beachfront luxury on the Gulf of Oman',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Coastal', 4.83, 310, 'Guest Favourite',
  'European elegance meets Omani hospitality on a private Gulf of Oman beach',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-swimming-pool-line|Pools','ri-restaurant-2-line|6 Restaurants','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Muscat'),
  'The Chedi Muscat', 'North Ghubra 232, Muscat', 5, '$300-$520',
  23.6038, 58.5693,
  'Zen-inspired resort with lagoon pools',
  'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  'Coastal', 4.88, 380, 'Luxury',
  'GHM''s minimalist retreat with the longest pool in the Middle East',
  JSON_ARRAY('ri-swimming-pool-line|600m Pool','ri-spa-line|The Spa','ri-restaurant-2-line|Fine Dining','ri-beach-line|Beach Club','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Zighy Bay'),
  'Six Senses Zighy Bay', 'Zighy Bay, Musandam Peninsula', 5, '$900-$1400',
  26.2051, 56.3512,
  'Remote dhow-village resort in Musandam',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Coastal', 4.97, 1050, 'Eco-Luxury',
  'Secluded village of private pool villas tucked in the dramatic Musandam fjords',
  JSON_ARRAY('ri-swimming-pool-line|Private Villa Pools','ri-spa-line|Six Senses Spa','ri-kayak-line|Kayaking','ri-restaurant-2-line|Farm Dining','ri-wifi-line|Free WiFi')
);

-- ASIA ───────────────────────────────────────────────────────

-- Tokyo
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tokyo'),
  'Park Hyatt Tokyo', '3-7-1-2 Nishi Shinjuku', 5, '$500-$900',
  35.6861, 139.6922,
  'Lost in Translation views over Shinjuku',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Iconic Cities', 4.94, 600, 'Luxury',
  'Floors 39–52 of Shinjuku Park Tower — New York Bar and city panorama iconic',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Spa','ri-restaurant-2-line|New York Bar','ri-wifi-line|Free WiFi','ri-service-line|Concierge')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tokyo'),
  'Aman Tokyo', '1-5-6 Otemachi, Chiyoda', 5, '$900-$1500',
  35.6862, 139.7639,
  'Serene urban sanctuary in Otemachi Tower',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Iconic Cities', 4.96, 1100, 'Luxury',
  'Sky-high Aman set within the Otemachi Tower with shoji-screen aesthetics',
  JSON_ARRAY('ri-spa-line|Aman Spa','ri-swimming-pool-line|50m Pool','ri-restaurant-2-line|Japanese Dining','ri-service-line|Personal Assistant','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tokyo'),
  'Trunk Hotel', '5-31 Jingumae, Shibuya', 4, '$200-$320',
  35.6640, 139.7111,
  'Lifestyle hotel in trendy Shibuya-Harajuku',
  'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800',
  'Iconic Cities', 4.7, 250, 'Guest Favourite',
  'Social-concept hotel with artisan restaurant and co-working spaces in Shibuya',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-line|Farm-to-Table','ri-community-line|Co-working','ri-map-pin-line|Harajuku')
);

-- Bangkok
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bangkok'),
  'Mandarin Oriental Bangkok', '48 Oriental Ave, Bang Rak', 5, '$350-$650',
  13.7254, 100.5136,
  'Colonial landmark on the Chao Phraya',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Cultural', 4.95, 420, 'Luxury',
  'The "Grande Dame of the Orient" — Bangkok''s most storied riverside hotel since 1876',
  JSON_ARRAY('ri-ship-line|River Shuttle','ri-swimming-pool-line|Pool','ri-spa-line|Oriental Spa','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bangkok'),
  'SO Bangkok', '2 North Sathorn Rd, Silom', 5, '$170-$280',
  13.7232, 100.5458,
  'Funky design hotel by Lumpini Park',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Iconic Cities', 4.68, 220, NULL,
  'Karl Lagerfeld-influenced tower with Park Society rooftop bar over Lumpini',
  JSON_ARRAY('ri-swimming-pool-line|Rooftop Pool','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi','ri-restaurant-line|Dining')
);

-- Chiang Rai
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chiang Rai'),
  'Anantara Golden Triangle Elephant Camp', ' 229 Moo 1, Chiang Saen', 5, '$300-$500',
  20.3513, 100.0755,
  'Elephant camp resort at the Golden Triangle',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Nature', 4.87, 370, 'Eco-Luxury',
  'Overlooks Myanmar and Laos at the Mekong junction — ethical elephant experiences',
  JSON_ARRAY('ri-swimming-pool-line|Infinity Pool','ri-spa-line|Spa','ri-restaurant-2-line|Dining','ri-leaf-line|Elephant Sanctuary','ri-wifi-line|Free WiFi')
);

-- Singapore
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Singapore'),
  'Marina Bay Sands', '10 Bayfront Ave, 018956', 5, '$550-$900',
  1.2834, 103.8607,
  'Infinity pool across three towers',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Iconic Cities', 4.82, 680, 'Iconic',
  'The world''s largest rooftop infinity pool atop three hotel towers over the bay',
  JSON_ARRAY('ri-swimming-pool-line|Infinity Pool','ri-restaurant-2-line|Celebrity Dining','ri-shopping-cart-line|The Shoppes','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Singapore'),
  'Capella Singapore', '1 The Knolls, Sentosa Island', 5, '$650-$1100',
  1.2476, 103.8214,
  'Colonial bungalows on Sentosa Island',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Nature', 4.93, 760, 'Luxury',
  'Restored colonial bungalows and villas designed by Norman Foster on Sentosa',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Capella Spa','ri-restaurant-2-line|Dining','ri-beach-line|Beach Access','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Singapore'),
  'Raffles Singapore', '1 Beach Rd, 189673', 5, '$650-$1050',
  1.2948, 103.8536,
  'Colonial grande dame and birthplace of the Singapore Sling',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Cultural', 4.9, 790, 'Iconic',
  '19th-century National Monument — all-suite hotel restored to its original splendour',
  JSON_ARRAY('ri-goblet-line|Long Bar (Singapore Sling)','ri-restaurant-2-line|Fine Dining','ri-spa-line|Raffles Spa','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

-- Hong Kong
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hong Kong'),
  'The Peninsula Hong Kong', 'Salisbury Rd, Tsim Sha Tsui', 5, '$600-$1000',
  22.2951, 114.1722,
  'The grand dame of Kowloon since 1928',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Iconic Cities', 4.95, 710, 'Luxury',
  'One of the world''s finest hotels with a fleet of Rolls-Royces and harbour views',
  JSON_ARRAY('ri-car-line|Rolls-Royce Fleet','ri-swimming-pool-line|Rooftop Pool','ri-restaurant-2-line|Felix Restaurant','ri-helicopter-line|Helipad','ri-spa-line|The Peninsula Spa')
);

-- Mumbai
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mumbai'),
  'Taj Mahal Palace Mumbai', 'Apollo Bunder, Colaba', 5, '$280-$550',
  18.9220, 72.8332,
  'Gateway of India landmark since 1903',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Cultural', 4.92, 350, 'Luxury',
  'Iconic Moorish-Gothic palace overlooking the Gateway of India and Arabian Sea',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Jiva Spa','ri-restaurant-2-line|9 Restaurants','ri-service-line|24h Butler','ri-wifi-line|Free WiFi')
);

-- Bali
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ubud'),
  'COMO Uma Ubud', 'Jalan Raya Sanggingan, Ubud', 5, '$350-$600',
  -8.5069, 115.2624,
  'Jungle villa retreat in the rice terraces',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Nature', 4.88, 420, 'Guest Favourite',
  'Intimate clifftop resort set among rice paddies with Shambhala spa',
  JSON_ARRAY('ri-swimming-pool-line|Infinity Pool','ri-spa-line|Shambhala Spa','ri-restaurant-2-line|Dining','ri-leaf-line|Jungle Walks','ri-wifi-line|Free WiFi')
);

-- Hanoi
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hanoi'),
  'Sofitel Legend Metropole Hanoi', '15 Ngo Quyen St, Hoan Kiem', 5, '$200-$400',
  21.0278, 105.8535,
  'French colonial icon in the Old Quarter',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Cultural', 4.91, 260, 'Luxury',
  'A National Historic Monument — Graham Greene and Charlie Chaplin both stayed here',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Le Spa du Metropole','ri-restaurant-2-line|Le Beaulieu','ri-wifi-line|Free WiFi','ri-building-line|Historic Monument')
);

-- French Polynesia
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tetiaroa'),
  'The Brando', 'Tetiaroa Private Island', 5, '$2800-$4500',
  -17.0204, -149.5573,
  'Marlon Brando''s private atoll in French Polynesia',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Coastal', 4.99, 3200, 'Eco-Luxury',
  'Carbon-neutral private island resort on Brando''s personal atoll — the ultimate escape',
  JSON_ARRAY('ri-beach-line|Private Atoll','ri-leaf-line|100% Eco-Powered','ri-restaurant-2-line|Dining','ri-swimming-pool-line|Villa Pools','ri-ship-line|Private Boat Charter')
);

-- AMERICAS ───────────────────────────────────────────────────

-- New York
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New York'),
  'The New York EDITION', '5 Madison Ave, New York 10010', 5, '$480-$780',
  40.7423, -73.9878,
  'Ian Schrager design in the Flatiron District',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Iconic Cities', 4.88, 590, 'Luxury',
  'Ian Schrager and Marriott collaboration in the 1909 Metropolitan Life Tower',
  JSON_ARRAY('ri-restaurant-2-line|Clock Tower','ri-spa-line|Fitness','ri-wifi-line|Free WiFi','ri-map-pin-line|Flatiron District')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New York'),
  'The Standard High Line', '848 Washington St, New York 10014', 4, '$260-$420',
  40.7403, -74.0083,
  'Straddling the High Line in the Meatpacking',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Iconic Cities', 4.65, 310, 'Guest Favourite',
  'Straddles the elevated High Line park with floor-to-ceiling windows and Hudson views',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi','ri-map-pin-line|High Line Access','ri-restaurant-line|Dining')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New York'),
  'Pod 51', '230 E 51st St, New York 10022', 3, '$100-$180',
  40.7571, -73.9676,
  'Clever micro-rooms in Midtown East',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Iconic Cities', 4.3, 130, 'Best Value',
  'Ingeniously designed compact rooms with all the essentials in central Midtown',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-line|Pod Bar','ri-map-pin-line|Midtown')
);

-- Los Angeles
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Los Angeles'),
  'Chateau Marmont', '8221 Sunset Blvd, West Hollywood', 4, '$380-$700',
  34.0983, -118.3680,
  'Legendary Hollywood haunt since 1929',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Cultural', 4.75, 480, 'Iconic',
  'Gothic castle on the Sunset Strip — the ultimate Hollywood hideaway',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-restaurant-2-line|Bar & Restaurant','ri-wifi-line|Free WiFi','ri-shield-check-line|Discreet Privacy')
);

-- Miami
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Miami'),
  'Faena Hotel Miami Beach', '3201 Collins Ave, Miami Beach', 5, '$550-$950',
  25.8099, -80.1221,
  'Alan Faena''s art-deco masterpiece on Collins',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Coastal', 4.85, 680, 'Luxury',
  'Bas Kosters-designed interiors, Damien Hirst mammoth, and direct oceanfront',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-swimming-pool-line|Pool','ri-spa-line|Tierra Santa Spa','ri-restaurant-2-line|Los Fuegos','ri-wifi-line|Free WiFi')
);

-- Utah / Canyon Point
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Canyon Point'),
  'Amangiri', '1 Kayenta Rd, Canyon Point UT 84741', 5, '$1800-$3200',
  37.0003, -111.8135,
  'Minimalist desert sanctuary in the Utah canyons',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Nature', 4.98, 2100, 'Eco-Luxury',
  'Poured-concrete pavilions wrapped around a mesa in the Grand Circle desert',
  JSON_ARRAY('ri-swimming-pool-line|Canyon Pool','ri-spa-line|Aman Spa','ri-mountain-line|Canyoneering','ri-restaurant-2-line|Mesa Restaurant','ri-wifi-line|Free WiFi')
);

-- Tulum
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tulum'),
  'Casa Malca Tulum', 'Carretera Tulum-Boca Paila Km 9.5', 5, '$310-$550',
  20.2081, -87.4654,
  'Pablo Escobar''s former jungle beach estate',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Coastal', 4.82, 390, 'Guest Favourite',
  'Boutique beachfront hotel on white-sand Tulum coast — once owned by Pablo Escobar',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Dining','ri-leaf-line|Jungle Cenotes','ri-wifi-line|Free WiFi')
);

-- Rio de Janeiro
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rio de Janeiro'),
  'Belmond Copacabana Palace', 'Av. Atlântica 1702, Copacabana', 5, '$420-$780',
  -22.9707, -43.1865,
  'White palace on the Copacabana beachfront',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Coastal', 4.9, 530, 'Luxury',
  'Rio''s most glamorous address since 1923 — Princess Diana and the Rolling Stones stayed here',
  JSON_ARRAY('ri-beach-line|Copacabana Beach','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Cipriani','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

-- Patagonia
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Torres del Paine'),
  'Explora Patagonia', 'Lago Pehoé, Torres del Paine', 5, '$700-$1100',
  -51.0265, -72.9956,
  'Immersive lodge in Patagonian wilderness',
  'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
  'Nature', 4.94, 820, 'Eco-Luxury',
  'All-inclusive adventure lodge inside Torres del Paine National Park',
  JSON_ARRAY('ri-mountain-line|Guided Treks','ri-swimming-pool-line|Heated Pool','ri-restaurant-2-line|All Inclusive','ri-leaf-line|National Park','ri-wifi-line|WiFi in Rooms')
);

-- Buenos Aires
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Buenos Aires'),
  'Four Seasons Buenos Aires', 'Posadas 1086/88, Recoleta', 5, '$320-$560',
  -34.5939, -58.3901,
  'Belle Époque mansion in Recoleta',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Cultural', 4.87, 390, 'Luxury',
  'Two interconnected buildings — a 12-floor tower and a landmark French-style mansion',
  JSON_ARRAY('ri-spa-line|The Spa','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Elena Restaurant','ri-wifi-line|Free WiFi','ri-service-line|Concierge')
);

-- AFRICA ─────────────────────────────────────────────────────

-- South Africa
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kruger'),
  'Singita Sabi Sand', 'Sabi Sand Game Reserve, Mpumalanga', 5, '$1700-$2500',
  -24.7799, 31.7261,
  'Ultra-luxury game lodge in a private reserve',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Nature', 4.99, 1950, 'Eco-Luxury',
  'Consecutive-year AA Travel Guides award winner — Big Five sightings daily',
  JSON_ARRAY('ri-leaf-line|Big Five Safari','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Dining','ri-spa-line|Wellness','ri-wifi-line|Free WiFi')
);

-- Tanzania
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ngorongoro'),
  'Ngorongoro Crater Lodge', 'Ngorongoro Conservation Area', 5, '$900-$1400',
  -3.2085, 35.4905,
  'Masai-inspired suites on the crater rim',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Nature', 4.95, 1100, 'Iconic',
  'Dramatic banana-leaf suites perched on the rim of the world''s largest intact caldera',
  JSON_ARRAY('ri-mountain-line|Crater Drives','ri-restaurant-2-line|Dining','ri-spa-line|Spa','ri-leaf-line|Conservation Area','ri-wifi-line|WiFi in Lodge')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Serengeti'),
  'Four Seasons Safari Lodge Serengeti', 'Serengeti National Park', 5, '$1400-$2200',
  -2.3344, 34.8280,
  'Luxury lodge inside the Serengeti',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Nature', 4.92, 1600, 'Luxury',
  'The only lodge inside the Serengeti with a watering hole that attracts wildlife to the deck',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Spa','ri-restaurant-2-line|Dining','ri-leaf-line|Game Drives','ri-wifi-line|Free WiFi')
);

-- Kenya
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Masai Mara'),
  'andBeyond Bateleur Camp', 'Kichwa Tembo, Masai Mara', 5, '$1200-$1800',
  -1.4061, 35.1522,
  'Classic tented camp in the heart of the Mara',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Nature', 4.93, 1400, 'Eco-Luxury',
  'Intimate 10-tent camp in prime Great Migration territory with private plunge pools',
  JSON_ARRAY('ri-leaf-line|Great Migration','ri-swimming-pool-line|Plunge Pool','ri-restaurant-2-line|Bush Dining','ri-map-pin-line|Prime Mara Location','ri-wifi-line|Free WiFi')
);

-- Morocco
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Marrakech'),
  'La Mamounia', 'Avenue Bab Jdid, Marrakech', 5, '$450-$850',
  31.6259, -7.9990,
  'Winston Churchill''s favourite Moroccan palace',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Cultural', 4.94, 560, 'Luxury',
  '18th-century palace set in 17 acres of century-old gardens — the most romantic hotel in Africa',
  JSON_ARRAY('ri-spa-line|La Mamounia Spa','ri-swimming-pool-line|Pools','ri-restaurant-2-line|5 Restaurants','ri-garden-line|Palace Gardens','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Marrakech'),
  'Riad Kniza', '34 Derb l''Hotel, Bab Doukkala', 4, '$170-$300',
  31.6324, -7.9892,
  'Authentic 18th-century riad in the medina',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Cultural', 4.89, 220, 'Guest Favourite',
  'An antique-dealer owner''s personal treasure — Moroccan craftsmanship at its finest',
  JSON_ARRAY('ri-swimming-pool-line|Plunge Pool','ri-restaurant-line|Moroccan Dining','ri-wifi-line|Free WiFi','ri-building-line|18th-Century Riad')
);

-- Egypt
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ain Sokhna'),
  'Mövenpick Resort El Sokhna', 'Ain Sokhna, Red Sea Governorate', 5, '$130-$240',
  29.5930, 32.3487,
  'Red Sea resort an easy drive from Cairo',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Coastal', 4.6, 180, NULL,
  'Full-service Red Sea beach resort 120 km from Cairo — popular for weekend escapes',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-swimming-pool-line|Multiple Pools','ri-restaurant-2-line|Dining','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

-- ── Step 2b: 201 Additional Destinations ─────────────────
-- New destinations
INSERT IGNORE INTO destinations (city, country) VALUES
  ('Amsterdam', 'Netherlands'),
  ('Vienna', 'Austria'),
  ('Prague', 'Czech Republic'),
  ('Lisbon', 'Portugal'),
  ('Athens', 'Greece'),
  ('Santorini', 'Greece'),
  ('Mykonos', 'Greece'),
  ('Istanbul', 'Turkey'),
  ('Cappadocia', 'Turkey'),
  ('Edinburgh', 'Scotland'),
  ('Dublin', 'Ireland'),
  ('Copenhagen', 'Denmark'),
  ('Stockholm', 'Sweden'),
  ('Oslo', 'Norway'),
  ('Helsinki', 'Finland'),
  ('Reykjavik', 'Iceland'),
  ('Budapest', 'Hungary'),
  ('Dubrovnik', 'Croatia'),
  ('Valletta', 'Malta'),
  ('Geneva', 'Switzerland'),
  ('Nice', 'France'),
  ('Lyon', 'France'),
  ('Bordeaux', 'France'),
  ('Florence', 'Italy'),
  ('Amalfi', 'Italy'),
  ('Positano', 'Italy'),
  ('Sicily', 'Italy'),
  ('Seville', 'Spain'),
  ('Madrid', 'Spain'),
  ('Ibiza', 'Spain'),
  ('Mallorca', 'Spain'),
  ('Bruges', 'Belgium'),
  ('Monaco', 'Monaco'),
  ('Porto', 'Portugal'),
  ('Algarve', 'Portugal'),
  ('Abu Dhabi', 'UAE'),
  ('Doha', 'Qatar'),
  ('Beirut', 'Lebanon'),
  ('Jerusalem', 'Israel'),
  ('Tel Aviv', 'Israel'),
  ('Petra', 'Jordan'),
  ('Dead Sea', 'Jordan'),
  ('Aqaba', 'Jordan'),
  ('Bahrain', 'Bahrain'),
  ('Musandam', 'Oman'),
  ('Salalah', 'Oman'),
  ('AlUla', 'Saudi Arabia'),
  ('Jeddah', 'Saudi Arabia'),
  ('Cairo', 'Egypt'),
  ('Luxor', 'Egypt'),
  ('Hurghada', 'Egypt'),
  ('Sharm el-Sheikh', 'Egypt'),
  ('Fez', 'Morocco'),
  ('Casablanca', 'Morocco'),
  ('Tangier', 'Morocco'),
  ('Agadir', 'Morocco'),
  ('Tunis', 'Tunisia'),
  ('Djerba', 'Tunisia'),
  ('Kyoto', 'Japan'),
  ('Osaka', 'Japan'),
  ('Hakone', 'Japan'),
  ('Niseko', 'Japan'),
  ('Seoul', 'South Korea'),
  ('Jeju', 'South Korea'),
  ('Busan', 'South Korea'),
  ('Beijing', 'China'),
  ('Shanghai', 'China'),
  ('Chengdu', 'China'),
  ('Guilin', 'China'),
  ('Lijiang', 'China'),
  ('Taipei', 'Taiwan'),
  ('Phuket', 'Thailand'),
  ('Koh Samui', 'Thailand'),
  ('Krabi', 'Thailand'),
  ('Pattaya', 'Thailand'),
  ('Maldives', 'Maldives'),
  ('Ho Chi Minh City', 'Vietnam'),
  ('Hoi An', 'Vietnam'),
  ('Da Nang', 'Vietnam'),
  ('Ha Long Bay', 'Vietnam'),
  ('Siem Reap', 'Cambodia'),
  ('Phnom Penh', 'Cambodia'),
  ('Colombo', 'Sri Lanka'),
  ('Sigiriya', 'Sri Lanka'),
  ('Kathmandu', 'Nepal'),
  ('Pokhara', 'Nepal'),
  ('Bhutan', 'Bhutan'),
  ('Goa', 'India'),
  ('Jaipur', 'India'),
  ('Udaipur', 'India'),
  ('Kerala', 'India'),
  ('Delhi', 'India'),
  ('Agra', 'India'),
  ('Yangon', 'Myanmar'),
  ('Bagan', 'Myanmar'),
  ('Langkawi', 'Malaysia'),
  ('Kuala Lumpur', 'Malaysia'),
  ('Penang', 'Malaysia'),
  ('Boracay', 'Philippines'),
  ('Palawan', 'Philippines'),
  ('Manila', 'Philippines'),
  ('Lombok', 'Indonesia'),
  ('Raja Ampat', 'Indonesia'),
  ('Komodo', 'Indonesia'),
  ('Jakarta', 'Indonesia'),
  ('Seminyak', 'Indonesia'),
  ('San Francisco', 'USA'),
  ('Chicago', 'USA'),
  ('Las Vegas', 'USA'),
  ('New Orleans', 'USA'),
  ('Seattle', 'USA'),
  ('Boston', 'USA'),
  ('Washington DC', 'USA'),
  ('Nashville', 'USA'),
  ('Aspen', 'USA'),
  ('Jackson Hole', 'USA'),
  ('Hawaii', 'USA'),
  ('Puerto Rico', 'USA'),
  ('Cancun', 'Mexico'),
  ('Mexico City', 'Mexico'),
  ('Oaxaca', 'Mexico'),
  ('Guadalajara', 'Mexico'),
  ('Los Cabos', 'Mexico'),
  ('Panama City', 'Panama'),
  ('Cartagena', 'Colombia'),
  ('Bogota', 'Colombia'),
  ('Medellín', 'Colombia'),
  ('Quito', 'Ecuador'),
  ('Galapagos', 'Ecuador'),
  ('Lima', 'Peru'),
  ('Machu Picchu', 'Peru'),
  ('Cusco', 'Peru'),
  ('La Paz', 'Bolivia'),
  ('Salta', 'Argentina'),
  ('Mendoza', 'Argentina'),
  ('Bariloche', 'Argentina'),
  ('Punta del Este', 'Uruguay'),
  ('Montevideo', 'Uruguay'),
  ('Santiago', 'Chile'),
  ('Valparaiso', 'Chile'),
  ('Sao Paulo', 'Brazil'),
  ('Salvador', 'Brazil'),
  ('Florianopolis', 'Brazil'),
  ('Belize City', 'Belize'),
  ('San José', 'Costa Rica'),
  ('Monteverde', 'Costa Rica'),
  ('Havana', 'Cuba'),
  ('Jamaica', 'Jamaica'),
  ('Barbados', 'Barbados'),
  ('St Lucia', 'St Lucia'),
  ('Turks and Caicos', 'Turks and Caicos'),
  ('Nassau', 'Bahamas'),
  ('Antigua', 'Antigua and Barbuda'),
  ('Cape Town', 'South Africa'),
  ('Johannesburg', 'South Africa'),
  ('Durban', 'South Africa'),
  ('Nairobi', 'Kenya'),
  ('Zanzibar', 'Tanzania'),
  ('Dar es Salaam', 'Tanzania'),
  ('Kigali', 'Rwanda'),
  ('Bwindi', 'Uganda'),
  ('Kampala', 'Uganda'),
  ('Accra', 'Ghana'),
  ('Lagos', 'Nigeria'),
  ('Abidjan', 'Côte d\'Ivoire'),
  ('Dakar', 'Senegal'),
  ('Addis Ababa', 'Ethiopia'),
  ('Lalibela', 'Ethiopia'),
  ('Victoria Falls', 'Zimbabwe'),
  ('Hwange', 'Zimbabwe'),
  ('Chobe', 'Botswana'),
  ('Okavango', 'Botswana'),
  ('Windhoek', 'Namibia'),
  ('Sossusvlei', 'Namibia'),
  ('Lamu', 'Kenya'),
  ('Amboseli', 'Kenya'),
  ('Seychelles', 'Seychelles'),
  ('Mauritius', 'Mauritius'),
  ('Reunion', 'Réunion'),
  ('Antananarivo', 'Madagascar'),
  ('Nosy Be', 'Madagascar'),
  ('Sydney', 'Australia'),
  ('Melbourne', 'Australia'),
  ('Brisbane', 'Australia'),
  ('Cairns', 'Australia'),
  ('Uluru', 'Australia'),
  ('Perth', 'Australia'),
  ('Gold Coast', 'Australia'),
  ('Whitsundays', 'Australia'),
  ('Auckland', 'New Zealand'),
  ('Queenstown', 'New Zealand'),
  ('Rotorua', 'New Zealand'),
  ('Christchurch', 'New Zealand'),
  ('Fiji', 'Fiji'),
  ('Bora Bora', 'French Polynesia'),
  ('Moorea', 'French Polynesia'),
  ('Samoa', 'Samoa'),
  ('Tonga', 'Tonga'),
  ('Palau', 'Palau'),
  ('Vanuatu', 'Vanuatu'),
  ('New Caledonia', 'New Caledonia');

-- Additional hotels (450 new, bringing total to 500)
INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amsterdam'),
  'Horizon Amsterdam Palace', '7 Harbour Dr, Amsterdam', 4, '$130-$215',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Wellness', 4.27, 138, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-garden-line|Garden','ri-wifi-line|Free WiFi','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amsterdam'),
  'Haven Amsterdam Spa Resort', '108 Grand Ave, Amsterdam', 5, '$350-$593',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Coastal', 4.75, 362, 'Best Value',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-spa-line|Spa','ri-restaurant-2-line|Fine Dining','ri-map-pin-line|City Centre','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Vienna'),
  'Premier Vienna Pavilion', '155 Ocean Blvd, Vienna', 3, '$500-$910',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Iconic Cities', 4.64, 615, NULL,
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-swimming-pool-line|Pool','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Vienna'),
  'The Vienna Manor', '26 Park Rd, Vienna', 4, '$250-$486',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
  'Cultural', 4.48, 292, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-leaf-line|Eco-Friendly','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Prague'),
  'Signature Prague Collection', '164 Harbour Dr, Prague', 4, '$400-$690',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Iconic Cities', 4.84, 424, 'Guest Favourite',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-24-hours-line|24h Reception','ri-map-pin-line|City Centre','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Prague'),
  'Boutique Prague Retreat', '64 Harbour Dr, Prague', 4, '$500-$954',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Cultural', 4.37, 649, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-spa-line|Spa','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lisbon'),
  'Tranquil Lisbon Boutique Hotel', '153 Main St, Lisbon', 5, '$200-$383',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Cultural', 4.97, 248, 'Luxury',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lisbon'),
  'Hotel Lisbon Residences', '112 Grand Ave, Lisbon', 5, '$70-$151',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Coastal', 4.6, 65, 'Iconic',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-service-line|Concierge','ri-restaurant-line|Breakfast Included','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Athens'),
  'Grand Athens Villas', '126 Main St, Athens', 3, '$180-$380',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Iconic Cities', 4.39, 202, 'Guest Favourite',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-ship-line|Water Transport','ri-service-line|Concierge','ri-fitness-line|Gym','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Athens'),
  'Maison Athens Collection', '136 Old Town Square, Athens', 5, '$130-$279',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Cultural', 4.52, 151, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-spa-line|Spa','ri-leaf-line|Eco-Friendly','ri-fitness-line|Gym','ri-restaurant-2-line|Fine Dining','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Santorini'),
  'Prime Santorini Spa Resort', '59 Royal Way, Santorini', 4, '$70-$108',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Iconic Cities', 4.92, 87, 'Guest Favourite',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-24-hours-line|24h Reception','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Santorini'),
  'Essence Santorini Golf Resort', '148 Park Rd, Santorini', 4, '$250-$516',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Iconic Cities', 4.72, 260, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-spa-line|Spa','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mykonos'),
  'Essence Mykonos Villas', '28 Grand Ave, Mykonos', 4, '$130-$243',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Coastal', 4.42, 129, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mykonos'),
  'The Mykonos Manor', '43 Park Rd, Mykonos', 5, '$250-$412',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1445991842772-097fea258e7b?w=800',
  'Coastal', 4.5, 323, 'Iconic',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-building-line|Historic Building','ri-ship-line|Water Transport','ri-24-hours-line|24h Reception','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Istanbul'),
  'Heritage Istanbul Inn', '15 Royal Way, Istanbul', 3, '$500-$859',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Nature', 4.6, 620, 'Best Value',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Istanbul'),
  'Aurora Istanbul Manor', '104 Main St, Istanbul', 4, '$350-$670',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Nature', 4.72, 394, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-shield-check-line|24h Security','ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cappadocia'),
  'Palace Cappadocia Residences', '118 Ocean Blvd, Cappadocia', 3, '$70-$127',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Iconic Cities', 4.62, 77, 'Best Value',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-restaurant-line|Breakfast Included','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cappadocia'),
  'Pearl Cappadocia Spa Resort', '181 Ocean Blvd, Cappadocia', 3, '$400-$828',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Iconic Cities', 4.94, 381, 'Guest Favourite',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Edinburgh'),
  'Heritage Edinburgh Inn', '184 Ocean Blvd, Edinburgh', 4, '$400-$777',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Nature', 4.4, 505, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi','ri-shield-check-line|24h Security','ri-service-line|Concierge','ri-garden-line|Garden')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Edinburgh'),
  'Boutique Edinburgh Lodge', '190 Park Rd, Edinburgh', 5, '$300-$452',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Coastal', 4.63, 370, 'Best Value',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dublin'),
  'Classic Dublin Pavilion', '54 Harbour Dr, Dublin', 4, '$400-$628',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Wellness', 4.79, 508, 'Eco-Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-building-line|Historic Building','ri-wifi-line|Free WiFi','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dublin'),
  'Essence Dublin Villas', '106 Old Town Square, Dublin', 4, '$150-$241',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Iconic Cities', 4.88, 148, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi','ri-mountain-line|Mountain Views','ri-map-pin-line|City Centre')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Copenhagen'),
  'Prestige Copenhagen Collection', '18 Old Town Square, Copenhagen', 4, '$180-$350',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Wellness', 4.46, 163, 'Iconic',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Spa','ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Copenhagen'),
  'Azure Copenhagen Beach Resort', '30 Park Rd, Copenhagen', 4, '$150-$229',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Wellness', 4.93, 167, 'Eco-Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-shield-check-line|24h Security','ri-fitness-line|Gym','ri-spa-line|Spa','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Stockholm'),
  'Heritage Stockholm Boutique Hotel', '84 Park Rd, Stockholm', 4, '$300-$476',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Nature', 4.74, 378, 'Iconic',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Stockholm'),
  'Azure Stockholm Golf Resort', '156 Harbour Dr, Stockholm', 5, '$250-$452',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Nature', 4.83, 320, 'Best Value',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Oslo'),
  'The Oslo Manor', '173 Ocean Blvd, Oslo', 4, '$130-$208',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Nature', 4.68, 156, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-24-hours-line|24h Reception','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Oslo'),
  'Palace Oslo Hotel', '193 Old Town Square, Oslo', 3, '$200-$330',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Iconic Cities', 4.64, 253, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-garden-line|Garden','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Helsinki'),
  'Serene Helsinki Luxury Hotel', '157 Old Town Square, Helsinki', 5, '$300-$543',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Nature', 4.56, 360, 'Iconic',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Helsinki'),
  'Boutique Helsinki Villas', '82 Royal Way, Helsinki', 3, '$110-$176',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Coastal', 4.76, 101, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-swimming-pool-line|Pool','ri-mountain-line|Mountain Views','ri-tennis-ball-line|Tennis Court','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Reykjavik'),
  'Serene Reykjavik Golf Resort', '179 Main St, Reykjavik', 5, '$250-$376',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Nature', 4.87, 320, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Reykjavik'),
  'Golden Reykjavik Hotel', '100 Ocean Blvd, Reykjavik', 5, '$500-$807',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Wellness', 4.62, 631, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-service-line|Concierge','ri-community-line|Co-working Space','ri-beach-line|Private Beach','ri-swimming-pool-line|Pool','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Budapest'),
  'Prestige Budapest Inn', '117 Ocean Blvd, Budapest', 5, '$200-$338',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Iconic Cities', 4.57, 239, 'Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi','ri-leaf-line|Eco-Friendly')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Budapest'),
  'Villa Budapest Hotel', '160 Grand Ave, Budapest', 4, '$110-$201',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Coastal', 4.57, 110, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubrovnik'),
  'Prime Dubrovnik Hotel', '80 Royal Way, Dubrovnik', 5, '$200-$431',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Wellness', 4.75, 230, 'Guest Favourite',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-spa-line|Spa','ri-swimming-pool-line|Pool','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubrovnik'),
  'Aurora Dubrovnik Pavilion', '18 Royal Way, Dubrovnik', 5, '$70-$146',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Nature', 4.96, 80, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-beach-line|Private Beach','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Valletta'),
  'Summit Valletta Spa Resort', '199 Park Rd, Valletta', 5, '$200-$415',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  'Cultural', 4.87, 246, 'Guest Favourite',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-community-line|Co-working Space','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Valletta'),
  'Premier Valletta Villas', '47 Park Rd, Valletta', 4, '$180-$370',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  'Wellness', 4.75, 181, 'Luxury',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Geneva'),
  'Elite Geneva Manor', '177 Park Rd, Geneva', 5, '$250-$513',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Coastal', 4.52, 249, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-ship-line|Water Transport','ri-shield-check-line|24h Security','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Geneva'),
  'Boutique Geneva Residences', '65 Grand Ave, Geneva', 3, '$500-$817',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Wellness', 4.95, 588, 'Eco-Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-fitness-line|Gym','ri-garden-line|Garden','ri-goblet-line|Rooftop Bar','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nice'),
  'Villa Nice Residences', '59 Ocean Blvd, Nice', 4, '$150-$226',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Cultural', 4.24, 138, 'Iconic',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-spa-line|Spa','ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nice'),
  'Golden Nice Grand Hotel', '113 Ocean Blvd, Nice', 4, '$70-$117',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Iconic Cities', 4.52, 65, 'Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-goblet-line|Rooftop Bar','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lyon'),
  'Hotel Lyon Spa Resort', '196 Park Rd, Lyon', 4, '$300-$529',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Wellness', 4.98, 306, 'Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lyon'),
  'Aurora Lyon Suites', '41 Grand Ave, Lyon', 4, '$300-$465',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Nature', 4.74, 326, 'Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bordeaux'),
  'Tranquil Bordeaux Golf Resort', '170 Old Town Square, Bordeaux', 4, '$200-$316',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
  'Coastal', 4.92, 246, 'Guest Favourite',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-fitness-line|Gym','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bordeaux'),
  'Hotel Bordeaux Luxury Hotel', '177 Ocean Blvd, Bordeaux', 5, '$150-$277',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Iconic Cities', 4.67, 188, NULL,
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court','ri-car-line|Valet Parking')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Florence'),
  'Prime Florence Resort', '196 Old Town Square, Florence', 4, '$250-$465',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  'Coastal', 4.99, 268, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-building-line|Historic Building','ri-shield-check-line|24h Security','ri-ship-line|Water Transport','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Florence'),
  'Maison Florence Villas', '106 Harbour Dr, Florence', 5, '$150-$294',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Wellness', 4.23, 140, 'Iconic',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amalfi'),
  'Aurora Amalfi Spa Resort', '119 Park Rd, Amalfi', 3, '$130-$242',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Nature', 4.69, 156, 'Eco-Luxury',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-community-line|Co-working Space','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amalfi'),
  'Grand Amalfi Manor', '182 Grand Ave, Amalfi', 4, '$300-$452',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Coastal', 4.98, 379, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-goblet-line|Rooftop Bar','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Positano'),
  'Azure Positano Grand Hotel', '121 Grand Ave, Positano', 5, '$300-$480',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Wellness', 4.79, 286, 'Guest Favourite',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-garden-line|Garden','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar','ri-restaurant-line|Breakfast Included')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Positano'),
  'Heritage Positano Golf Resort', '149 Harbour Dr, Positano', 5, '$110-$199',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Cultural', 4.64, 122, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-leaf-line|Eco-Friendly','ri-map-pin-line|City Centre','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sicily'),
  'Royal Sicily Villas', '191 Park Rd, Sicily', 5, '$200-$438',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Iconic Cities', 4.3, 257, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sicily'),
  'Pearl Sicily Hotel', '185 Grand Ave, Sicily', 5, '$400-$871',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Cultural', 4.47, 470, 'Guest Favourite',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seville'),
  'Summit Seville Suites', '61 Harbour Dr, Seville', 4, '$130-$262',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Iconic Cities', 4.55, 153, 'Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-restaurant-line|Breakfast Included','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seville'),
  'Palace Seville Manor', '136 Park Rd, Seville', 4, '$110-$178',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Wellness', 4.74, 120, 'Best Value',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-community-line|Co-working Space','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi','ri-fitness-line|Gym','ri-24-hours-line|24h Reception')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Madrid'),
  'Heritage Madrid Spa Resort', '41 Main St, Madrid', 5, '$180-$394',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Nature', 4.75, 194, 'Iconic',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-spa-line|Spa','ri-leaf-line|Eco-Friendly','ri-map-pin-line|City Centre','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Madrid'),
  'Heritage Madrid Residences', '6 Old Town Square, Madrid', 5, '$150-$225',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Nature', 4.86, 189, 'Eco-Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-mountain-line|Mountain Views','ri-car-line|Valet Parking','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ibiza'),
  'Classic Ibiza Resort', '80 Old Town Square, Ibiza', 5, '$70-$133',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Cultural', 4.46, 74, 'Eco-Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-garden-line|Garden','ri-tennis-ball-line|Tennis Court','ri-car-line|Valet Parking','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ibiza'),
  'Luxe Ibiza Grand Hotel', '76 Harbour Dr, Ibiza', 5, '$90-$164',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Coastal', 4.88, 107, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi','ri-car-line|Valet Parking','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mallorca'),
  'Pearl Mallorca Pavilion', '173 Harbour Dr, Mallorca', 4, '$350-$618',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Coastal', 4.57, 401, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-community-line|Co-working Space','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mallorca'),
  'Hotel Mallorca Retreat', '12 Main St, Mallorca', 4, '$250-$395',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Coastal', 4.51, 262, NULL,
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-spa-line|Spa','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bruges'),
  'Boutique Bruges Resort', '177 Ocean Blvd, Bruges', 4, '$250-$452',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Iconic Cities', 4.97, 261, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-spa-line|Spa','ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bruges'),
  'Villa Bruges Hotel', '13 Old Town Square, Bruges', 5, '$130-$284',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Iconic Cities', 4.86, 145, 'Eco-Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-service-line|Concierge','ri-wifi-line|Free WiFi','ri-car-line|Valet Parking')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Monaco'),
  'Premier Monaco Retreat', '34 Royal Way, Monaco', 4, '$110-$173',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Iconic Cities', 4.48, 133, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-swimming-pool-line|Pool','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Monaco'),
  'Silver Monaco Palace', '191 Main St, Monaco', 5, '$250-$511',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Iconic Cities', 4.56, 247, 'Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-wifi-line|Free WiFi','ri-swimming-pool-line|Pool','ri-24-hours-line|24h Reception','ri-map-pin-line|City Centre')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Porto'),
  'Azure Porto Palace', '126 Harbour Dr, Porto', 5, '$90-$191',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Coastal', 4.25, 90, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-garden-line|Garden','ri-building-line|Historic Building','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Porto'),
  'Premier Porto Spa Resort', '185 Old Town Square, Porto', 4, '$200-$363',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Cultural', 4.85, 211, 'Guest Favourite',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-car-line|Valet Parking','ri-restaurant-line|Breakfast Included','ri-service-line|Concierge','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Algarve'),
  'The Algarve Suites', '24 Park Rd, Algarve', 3, '$500-$1008',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Iconic Cities', 4.66, 562, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Algarve'),
  'Premier Algarve Resort', '74 Royal Way, Algarve', 4, '$180-$283',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Coastal', 4.72, 178, 'Guest Favourite',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-spa-line|Spa','ri-car-line|Valet Parking','ri-leaf-line|Eco-Friendly','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Abu Dhabi'),
  'Summit Abu Dhabi Collection', '8 Grand Ave, Abu Dhabi', 4, '$500-$1016',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Iconic Cities', 4.34, 478, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-2-line|Fine Dining','ri-garden-line|Garden','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Abu Dhabi'),
  'Signature Abu Dhabi Boutique Hotel', '117 Ocean Blvd, Abu Dhabi', 4, '$180-$309',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Wellness', 4.67, 225, 'Best Value',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Doha'),
  'Aurora Doha Boutique Hotel', '125 Royal Way, Doha', 5, '$200-$338',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Cultural', 4.54, 202, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-leaf-line|Eco-Friendly','ri-map-pin-line|City Centre','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Doha'),
  'Villa Doha Residences', '55 Old Town Square, Doha', 4, '$150-$255',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Nature', 4.79, 145, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-garden-line|Garden','ri-ship-line|Water Transport','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Beirut'),
  'Signature Beirut Resort', '112 Main St, Beirut', 5, '$90-$189',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Wellness', 4.52, 104, 'Iconic',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-shield-check-line|24h Security','ri-beach-line|Private Beach','ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-swimming-pool-line|Pool')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Beirut'),
  'Azure Beirut Palace', '63 Park Rd, Beirut', 5, '$300-$466',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Cultural', 4.38, 363, 'Guest Favourite',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-garden-line|Garden','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jerusalem'),
  'Classic Jerusalem Pavilion', '90 Harbour Dr, Jerusalem', 4, '$130-$204',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Coastal', 4.68, 156, 'Guest Favourite',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-fitness-line|Gym','ri-tennis-ball-line|Tennis Court','ri-shield-check-line|24h Security','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jerusalem'),
  'Pearl Jerusalem Suites', '121 Park Rd, Jerusalem', 4, '$150-$287',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Iconic Cities', 4.45, 162, 'Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-tennis-ball-line|Tennis Court','ri-garden-line|Garden','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tel Aviv'),
  'Prime Tel Aviv Spa Resort', '190 Main St, Tel Aviv', 5, '$350-$684',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Nature', 4.6, 449, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-garden-line|Garden','ri-beach-line|Private Beach','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tel Aviv'),
  'Haven Tel Aviv Luxury Hotel', '113 Royal Way, Tel Aviv', 4, '$180-$316',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Nature', 4.81, 210, 'Luxury',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-shield-check-line|24h Security','ri-spa-line|Spa','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Petra'),
  'Boutique Petra Retreat', '86 Main St, Petra', 4, '$180-$309',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Wellness', 4.76, 168, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-service-line|Concierge','ri-garden-line|Garden','ri-restaurant-2-line|Fine Dining','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Petra'),
  'Grand Petra Pavilion', '80 Grand Ave, Petra', 4, '$180-$389',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Coastal', 4.99, 173, 'Iconic',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-garden-line|Garden','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dead Sea'),
  'Royal Dead Sea Villas', '197 Royal Way, Dead Sea', 4, '$350-$617',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Wellness', 4.84, 338, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-leaf-line|Eco-Friendly','ri-community-line|Co-working Space','ri-goblet-line|Rooftop Bar','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dead Sea'),
  'Elite Dead Sea Manor', '80 Old Town Square, Dead Sea', 5, '$130-$228',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Nature', 4.81, 157, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-service-line|Concierge','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Aqaba'),
  'Horizon Aqaba Grand Hotel', '96 Royal Way, Aqaba', 3, '$500-$1046',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Iconic Cities', 4.8, 504, 'Best Value',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Aqaba'),
  'Royal Aqaba House', '129 Ocean Blvd, Aqaba', 4, '$200-$439',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Iconic Cities', 4.45, 187, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-service-line|Concierge','ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bahrain'),
  'Haven Bahrain Retreat', '195 Harbour Dr, Bahrain', 5, '$250-$482',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Cultural', 4.37, 239, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-goblet-line|Rooftop Bar','ri-spa-line|Spa','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bahrain'),
  'Azure Bahrain Luxury Hotel', '17 Main St, Bahrain', 5, '$350-$656',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Coastal', 4.77, 355, 'Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-fitness-line|Gym','ri-building-line|Historic Building','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Musandam'),
  'Silver Musandam Pavilion', '18 Royal Way, Musandam', 3, '$200-$422',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Nature', 4.98, 200, 'Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Musandam'),
  'Serene Musandam Golf Resort', '189 Old Town Square, Musandam', 5, '$110-$168',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800',
  'Coastal', 4.86, 129, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-service-line|Concierge','ri-restaurant-2-line|Fine Dining','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Salalah'),
  'Heritage Salalah Inn', '12 Old Town Square, Salalah', 4, '$70-$120',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Nature', 4.98, 78, 'Iconic',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-restaurant-line|Breakfast Included','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Salalah'),
  'Boutique Salalah Palace', '95 Park Rd, Salalah', 5, '$500-$903',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800',
  'Coastal', 4.59, 549, 'Iconic',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='AlUla'),
  'Summit AlUla Lodge', '140 Ocean Blvd, AlUla', 5, '$90-$140',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Nature', 4.68, 96, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-restaurant-line|Breakfast Included','ri-building-line|Historic Building','ri-car-line|Valet Parking','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='AlUla'),
  'Aurora AlUla House', '94 Royal Way, AlUla', 4, '$70-$111',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Nature', 4.23, 64, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-swimming-pool-line|Pool','ri-service-line|Concierge','ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jeddah'),
  'Pearl Jeddah Suites', '147 Grand Ave, Jeddah', 5, '$200-$344',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Iconic Cities', 4.22, 194, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jeddah'),
  'Villa Jeddah Residences', '178 Park Rd, Jeddah', 4, '$90-$143',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Coastal', 4.91, 97, 'Guest Favourite',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-restaurant-2-line|Fine Dining','ri-ship-line|Water Transport','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cairo'),
  'Premier Cairo Lodge', '183 Harbour Dr, Cairo', 4, '$180-$334',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Coastal', 4.39, 197, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-ship-line|Water Transport','ri-service-line|Concierge','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cairo'),
  'Heritage Cairo House', '184 Harbour Dr, Cairo', 5, '$300-$536',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Iconic Cities', 4.3, 308, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-garden-line|Garden','ri-restaurant-line|Breakfast Included','ri-service-line|Concierge','ri-beach-line|Private Beach','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Luxor'),
  'Silver Luxor Resort', '32 Royal Way, Luxor', 4, '$150-$242',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Coastal', 4.47, 191, 'Iconic',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Luxor'),
  'Boutique Luxor Retreat', '161 Ocean Blvd, Luxor', 3, '$300-$584',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Coastal', 4.34, 344, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-restaurant-2-line|Fine Dining','ri-swimming-pool-line|Pool')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hurghada'),
  'Horizon Hurghada Golf Resort', '68 Harbour Dr, Hurghada', 4, '$350-$627',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Wellness', 4.43, 448, NULL,
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-swimming-pool-line|Pool','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hurghada'),
  'Azure Hurghada Grand Hotel', '119 Grand Ave, Hurghada', 5, '$350-$560',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Cultural', 4.97, 333, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sharm el-Sheikh'),
  'Hotel Sharm el-Sheikh Collection', '116 Grand Ave, Sharm el-Sheikh', 4, '$90-$138',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Nature', 4.4, 112, 'Best Value',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-shield-check-line|24h Security','ri-mountain-line|Mountain Views','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sharm el-Sheikh'),
  'Silver Sharm el-Sheikh Luxury Hotel', '128 Ocean Blvd, Sharm el-Sheikh', 5, '$70-$109',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Nature', 4.96, 69, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Fez'),
  'Heritage Fez Spa Resort', '3 Old Town Square, Fez', 3, '$200-$318',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Cultural', 4.8, 209, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-ship-line|Water Transport','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Fez'),
  'Signature Fez Beach Resort', '116 Old Town Square, Fez', 4, '$350-$691',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Iconic Cities', 4.51, 426, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-service-line|Concierge','ri-mountain-line|Mountain Views','ri-garden-line|Garden','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Casablanca'),
  'Royal Casablanca Resort', '36 Harbour Dr, Casablanca', 5, '$250-$465',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Wellness', 4.31, 318, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-goblet-line|Rooftop Bar','ri-shield-check-line|24h Security','ri-garden-line|Garden','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Casablanca'),
  'Prime Casablanca Residences', '122 Old Town Square, Casablanca', 3, '$180-$311',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Wellness', 4.44, 226, 'Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-fitness-line|Gym','ri-leaf-line|Eco-Friendly','ri-swimming-pool-line|Pool','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tangier'),
  'Silver Tangier House', '38 Old Town Square, Tangier', 4, '$70-$133',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Iconic Cities', 4.55, 74, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-garden-line|Garden','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tangier'),
  'Haven Tangier Retreat', '133 Grand Ave, Tangier', 5, '$400-$733',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Coastal', 4.56, 445, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-24-hours-line|24h Reception','ri-mountain-line|Mountain Views','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Agadir'),
  'Elite Agadir Residences', '58 Ocean Blvd, Agadir', 4, '$500-$822',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Nature', 4.48, 636, 'Iconic',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Agadir'),
  'Classic Agadir House', '89 Old Town Square, Agadir', 4, '$150-$229',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Nature', 4.72, 179, 'Eco-Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-car-line|Valet Parking','ri-service-line|Concierge','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tunis'),
  'Resort Tunis Resort', '172 Royal Way, Tunis', 4, '$400-$665',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Cultural', 4.77, 376, 'Best Value',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-24-hours-line|24h Reception','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tunis'),
  'Serene Tunis Residences', '83 Ocean Blvd, Tunis', 3, '$90-$176',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Iconic Cities', 4.92, 87, 'Best Value',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Djerba'),
  'Essence Djerba Residences', '10 Main St, Djerba', 4, '$350-$672',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Nature', 4.98, 391, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-garden-line|Garden','ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Djerba'),
  'Tranquil Djerba Palace', '85 Grand Ave, Djerba', 5, '$400-$672',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Cultural', 4.82, 450, 'Eco-Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-garden-line|Garden','ri-shield-check-line|24h Security','ri-restaurant-2-line|Fine Dining','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kyoto'),
  'Hotel Kyoto Lodge', '36 Park Rd, Kyoto', 5, '$130-$195',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Nature', 4.8, 166, 'Iconic',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kyoto'),
  'Royal Kyoto Palace', '120 Ocean Blvd, Kyoto', 4, '$200-$396',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Iconic Cities', 4.7, 255, NULL,
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-service-line|Concierge','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Osaka'),
  'Pearl Osaka Pavilion', '107 Harbour Dr, Osaka', 5, '$300-$618',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Coastal', 4.74, 341, 'Guest Favourite',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-garden-line|Garden','ri-restaurant-line|Breakfast Included','ri-restaurant-2-line|Fine Dining','ri-spa-line|Spa','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Osaka'),
  'Elite Osaka Beach Resort', '52 Royal Way, Osaka', 4, '$110-$190',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Iconic Cities', 4.74, 130, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-community-line|Co-working Space','ri-service-line|Concierge','ri-garden-line|Garden','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hakone'),
  'Prime Hakone Resort', '144 Park Rd, Hakone', 4, '$500-$757',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Coastal', 4.66, 459, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hakone'),
  'Golden Hakone Resort', '74 Park Rd, Hakone', 4, '$110-$223',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Nature', 4.55, 139, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Niseko'),
  'Hotel Niseko Lodge', '138 Park Rd, Niseko', 4, '$500-$1092',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Iconic Cities', 4.97, 542, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court','ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Niseko'),
  'Villa Niseko Palace', '9 Old Town Square, Niseko', 5, '$350-$712',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Coastal', 4.25, 398, NULL,
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seoul'),
  'Pearl Seoul Manor', '139 Grand Ave, Seoul', 3, '$110-$203',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Wellness', 4.45, 125, NULL,
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-service-line|Concierge','ri-garden-line|Garden','ri-leaf-line|Eco-Friendly','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seoul'),
  'Boutique Seoul Resort', '143 Royal Way, Seoul', 4, '$400-$790',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Iconic Cities', 4.97, 510, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-tennis-ball-line|Tennis Court','ri-service-line|Concierge','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jeju'),
  'Maison Jeju Spa Resort', '122 Grand Ave, Jeju', 4, '$150-$315',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Iconic Cities', 4.64, 193, 'Best Value',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jeju'),
  'Pearl Jeju Pavilion', '24 Royal Way, Jeju', 4, '$70-$118',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Iconic Cities', 4.89, 68, 'Eco-Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Busan'),
  'Villa Busan Palace', '192 Old Town Square, Busan', 5, '$130-$258',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Coastal', 4.64, 157, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-car-line|Valet Parking','ri-restaurant-line|Breakfast Included','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Busan'),
  'Pearl Busan Palace', '185 Park Rd, Busan', 5, '$130-$228',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Wellness', 4.88, 155, 'Luxury',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-service-line|Concierge','ri-mountain-line|Mountain Views','ri-shield-check-line|24h Security','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Beijing'),
  'Prime Beijing Manor', '128 Royal Way, Beijing', 5, '$150-$305',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Nature', 4.56, 178, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Beijing'),
  'Silver Beijing Resort', '20 Old Town Square, Beijing', 3, '$70-$125',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Coastal', 4.21, 77, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi','ri-fitness-line|Gym','ri-building-line|Historic Building','ri-ship-line|Water Transport','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Shanghai'),
  'Silver Shanghai Collection', '138 Ocean Blvd, Shanghai', 3, '$300-$620',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Iconic Cities', 4.93, 332, 'Eco-Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-car-line|Valet Parking','ri-map-pin-line|City Centre','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Shanghai'),
  'Signature Shanghai Luxury Hotel', '145 Grand Ave, Shanghai', 4, '$150-$296',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
  'Iconic Cities', 4.27, 157, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chengdu'),
  'Premier Chengdu Boutique Hotel', '166 Old Town Square, Chengdu', 5, '$350-$764',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Iconic Cities', 4.38, 441, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chengdu'),
  'Prime Chengdu Resort', '46 Old Town Square, Chengdu', 5, '$70-$152',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Nature', 4.93, 71, 'Eco-Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-shield-check-line|24h Security','ri-map-pin-line|City Centre','ri-service-line|Concierge','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Guilin'),
  'Essence Guilin Pavilion', '14 Main St, Guilin', 5, '$130-$271',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Wellness', 4.95, 137, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-24-hours-line|24h Reception','ri-leaf-line|Eco-Friendly','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Guilin'),
  'Azure Guilin Lodge', '175 Royal Way, Guilin', 5, '$90-$183',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Iconic Cities', 4.26, 86, 'Best Value',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-restaurant-line|Breakfast Included','ri-spa-line|Spa','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi','ri-service-line|Concierge')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lijiang'),
  'Pearl Lijiang Pavilion', '195 Ocean Blvd, Lijiang', 3, '$110-$171',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Wellness', 4.64, 116, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-restaurant-2-line|Fine Dining','ri-shield-check-line|24h Security','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lijiang'),
  'Heritage Lijiang Boutique Hotel', '100 Old Town Square, Lijiang', 3, '$500-$1065',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Wellness', 4.33, 526, 'Best Value',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-24-hours-line|24h Reception','ri-service-line|Concierge','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Taipei'),
  'Azure Taipei Collection', '108 Ocean Blvd, Taipei', 5, '$90-$157',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Nature', 4.67, 88, 'Guest Favourite',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-fitness-line|Gym','ri-ship-line|Water Transport')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Taipei'),
  'Pearl Taipei Villas', '111 Old Town Square, Taipei', 4, '$150-$258',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Cultural', 4.34, 158, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-leaf-line|Eco-Friendly','ri-shield-check-line|24h Security','ri-map-pin-line|City Centre','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Phuket'),
  'Tranquil Phuket House', '94 Main St, Phuket', 4, '$350-$769',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Wellness', 4.22, 416, 'Eco-Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-building-line|Historic Building','ri-24-hours-line|24h Reception','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Phuket'),
  'Resort Phuket Collection', '169 Grand Ave, Phuket', 5, '$200-$310',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Wellness', 4.52, 220, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Koh Samui'),
  'Hotel Koh Samui Manor', '169 Harbour Dr, Koh Samui', 5, '$110-$214',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Nature', 4.96, 113, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-spa-line|Spa','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Koh Samui'),
  'Silver Koh Samui Beach Resort', '143 Royal Way, Koh Samui', 4, '$250-$440',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Wellness', 4.75, 240, 'Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Krabi'),
  'Hotel Krabi Retreat', '90 Ocean Blvd, Krabi', 5, '$250-$512',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Cultural', 4.58, 268, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Krabi'),
  'Grand Krabi Villas', '166 Main St, Krabi', 4, '$500-$835',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Coastal', 4.46, 535, NULL,
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-tennis-ball-line|Tennis Court','ri-building-line|Historic Building','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi','ri-restaurant-line|Breakfast Included')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Pattaya'),
  'Summit Pattaya Inn', '116 Royal Way, Pattaya', 5, '$200-$300',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Cultural', 4.79, 244, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Pattaya'),
  'Prestige Pattaya Inn', '118 Main St, Pattaya', 4, '$400-$841',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Cultural', 4.67, 457, 'Guest Favourite',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-beach-line|Private Beach','ri-goblet-line|Rooftop Bar','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Maldives'),
  'Prestige Maldives Palace', '62 Ocean Blvd, Maldives', 3, '$110-$193',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Nature', 4.53, 105, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-ship-line|Water Transport','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Maldives'),
  'Golden Maldives Residences', '36 Grand Ave, Maldives', 5, '$250-$483',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Nature', 4.31, 306, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-community-line|Co-working Space','ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ho Chi Minh City'),
  'Grand Ho Chi Minh City Manor', '75 Main St, Ho Chi Minh City', 4, '$130-$243',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Nature', 4.65, 157, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ho Chi Minh City'),
  'Serene Ho Chi Minh City Spa Resort', '94 Royal Way, Ho Chi Minh City', 3, '$500-$904',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Iconic Cities', 4.78, 580, 'Eco-Luxury',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hoi An'),
  'Premier Hoi An Suites', '113 Old Town Square, Hoi An', 3, '$130-$214',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Cultural', 4.88, 148, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-tennis-ball-line|Tennis Court','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hoi An'),
  'Elite Hoi An Collection', '153 Royal Way, Hoi An', 4, '$180-$393',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Wellness', 4.41, 223, 'Guest Favourite',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-car-line|Valet Parking','ri-service-line|Concierge','ri-ship-line|Water Transport','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Da Nang'),
  'Haven Da Nang Villas', '64 Old Town Square, Da Nang', 5, '$250-$399',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Nature', 4.5, 232, 'Guest Favourite',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-community-line|Co-working Space','ri-24-hours-line|24h Reception','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Da Nang'),
  'Premier Da Nang Suites', '188 Park Rd, Da Nang', 5, '$90-$185',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Nature', 4.85, 98, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-ship-line|Water Transport','ri-service-line|Concierge','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ha Long Bay'),
  'Classic Ha Long Bay Resort', '12 Main St, Ha Long Bay', 5, '$70-$111',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Nature', 4.2, 89, 'Eco-Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-beach-line|Private Beach','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ha Long Bay'),
  'Horizon Ha Long Bay Pavilion', '65 Main St, Ha Long Bay', 5, '$400-$853',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1445991842772-097fea258e7b?w=800',
  'Nature', 4.69, 476, 'Eco-Luxury',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-spa-line|Spa','ri-wifi-line|Free WiFi','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Siem Reap'),
  'Golden Siem Reap Suites', '34 Royal Way, Siem Reap', 4, '$300-$592',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Cultural', 4.85, 388, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Siem Reap'),
  'The Siem Reap Palace', '27 Ocean Blvd, Siem Reap', 5, '$150-$239',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
  'Coastal', 4.25, 168, 'Best Value',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-service-line|Concierge','ri-building-line|Historic Building','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Phnom Penh'),
  'The Phnom Penh Palace', '36 Old Town Square, Phnom Penh', 3, '$350-$703',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Cultural', 4.82, 349, 'Guest Favourite',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar','ri-mountain-line|Mountain Views','ri-garden-line|Garden','ri-ship-line|Water Transport')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Phnom Penh'),
  'Essence Phnom Penh House', '76 Harbour Dr, Phnom Penh', 3, '$130-$240',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Nature', 4.7, 120, 'Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-service-line|Concierge','ri-map-pin-line|City Centre','ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Colombo'),
  'Serene Colombo Grand Hotel', '198 Main St, Colombo', 3, '$350-$541',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Iconic Cities', 4.93, 447, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-garden-line|Garden','ri-building-line|Historic Building','ri-fitness-line|Gym','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Colombo'),
  'Horizon Colombo Spa Resort', '138 Royal Way, Colombo', 4, '$150-$233',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Coastal', 4.97, 144, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sigiriya'),
  'Royal Sigiriya Manor', '23 Park Rd, Sigiriya', 3, '$250-$482',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Coastal', 4.29, 295, 'Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-garden-line|Garden','ri-fitness-line|Gym','ri-car-line|Valet Parking','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sigiriya'),
  'Palace Sigiriya Collection', '188 Main St, Sigiriya', 3, '$180-$371',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Iconic Cities', 4.41, 232, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-garden-line|Garden','ri-restaurant-line|Breakfast Included','ri-swimming-pool-line|Pool','ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kathmandu'),
  'Maison Kathmandu Collection', '198 Main St, Kathmandu', 3, '$130-$262',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Iconic Cities', 4.39, 141, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-swimming-pool-line|Pool','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kathmandu'),
  'Resort Kathmandu Villas', '64 Park Rd, Kathmandu', 5, '$150-$311',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Iconic Cities', 4.6, 189, 'Best Value',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Pokhara'),
  'Premier Pokhara Residences', '199 Old Town Square, Pokhara', 4, '$180-$280',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Cultural', 4.36, 202, 'Iconic',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Pokhara'),
  'Essence Pokhara Spa Resort', '195 Old Town Square, Pokhara', 4, '$110-$165',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Coastal', 4.63, 126, 'Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bhutan'),
  'Villa Bhutan Beach Resort', '61 Park Rd, Bhutan', 5, '$70-$152',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Cultural', 4.27, 88, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-spa-line|Spa','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bhutan'),
  'Horizon Bhutan House', '20 Royal Way, Bhutan', 3, '$200-$392',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Cultural', 4.41, 205, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Goa'),
  'Villa Goa Retreat', '200 Old Town Square, Goa', 3, '$110-$173',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Cultural', 4.52, 122, 'Eco-Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-spa-line|Spa','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Goa'),
  'Tranquil Goa Residences', '181 Harbour Dr, Goa', 3, '$130-$271',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Iconic Cities', 4.76, 167, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jaipur'),
  'Grand Jaipur House', '116 Royal Way, Jaipur', 4, '$90-$164',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Iconic Cities', 4.25, 109, 'Eco-Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-restaurant-line|Breakfast Included','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jaipur'),
  'Luxe Jaipur Suites', '6 Main St, Jaipur', 4, '$400-$724',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Cultural', 4.3, 510, 'Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi','ri-tennis-ball-line|Tennis Court','ri-building-line|Historic Building','ri-restaurant-2-line|Fine Dining')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Udaipur'),
  'Imperial Udaipur Inn', '48 Ocean Blvd, Udaipur', 4, '$250-$529',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Wellness', 4.69, 289, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-restaurant-2-line|Fine Dining','ri-car-line|Valet Parking','ri-map-pin-line|City Centre','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Udaipur'),
  'Villa Udaipur Beach Resort', '64 Harbour Dr, Udaipur', 3, '$200-$409',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Wellness', 4.82, 207, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-wifi-line|Free WiFi','ri-shield-check-line|24h Security','ri-leaf-line|Eco-Friendly','ri-fitness-line|Gym')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kerala'),
  'Classic Kerala Collection', '15 Old Town Square, Kerala', 5, '$300-$525',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Coastal', 4.28, 348, 'Iconic',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kerala'),
  'Imperial Kerala Lodge', '46 Grand Ave, Kerala', 5, '$500-$994',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Cultural', 4.95, 562, 'Eco-Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-goblet-line|Rooftop Bar','ri-beach-line|Private Beach','ri-24-hours-line|24h Reception','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Delhi'),
  'Royal Delhi Manor', '155 Grand Ave, Delhi', 3, '$300-$550',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Coastal', 4.84, 310, 'Best Value',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi','ri-service-line|Concierge','ri-ship-line|Water Transport','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Delhi'),
  'Premier Delhi Beach Resort', '94 Main St, Delhi', 5, '$500-$1079',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Iconic Cities', 4.47, 514, 'Best Value',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-shield-check-line|24h Security','ri-beach-line|Private Beach','ri-restaurant-line|Breakfast Included','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Agra'),
  'Prime Agra Lodge', '97 Ocean Blvd, Agra', 4, '$110-$178',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Wellness', 4.51, 142, 'Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-leaf-line|Eco-Friendly','ri-spa-line|Spa','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Agra'),
  'Prestige Agra Suites', '61 Ocean Blvd, Agra', 5, '$110-$213',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Cultural', 4.55, 110, 'Eco-Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Yangon'),
  'Essence Yangon Hotel', '13 Park Rd, Yangon', 5, '$500-$896',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Nature', 4.9, 520, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-leaf-line|Eco-Friendly','ri-beach-line|Private Beach','ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Yangon'),
  'Premier Yangon Resort', '76 Main St, Yangon', 5, '$150-$324',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800',
  'Coastal', 4.9, 144, 'Guest Favourite',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bagan'),
  'Azure Bagan Lodge', '156 Park Rd, Bagan', 4, '$70-$109',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Nature', 4.75, 83, 'Iconic',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-leaf-line|Eco-Friendly','ri-spa-line|Spa','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bagan'),
  'Prime Bagan Spa Resort', '126 Grand Ave, Bagan', 3, '$180-$270',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Wellness', 4.58, 168, 'Eco-Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-24-hours-line|24h Reception','ri-spa-line|Spa','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Langkawi'),
  'Golden Langkawi Grand Hotel', '170 Ocean Blvd, Langkawi', 3, '$400-$752',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Nature', 4.49, 431, 'Iconic',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court','ri-swimming-pool-line|Pool','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Langkawi'),
  'Haven Langkawi Palace', '22 Harbour Dr, Langkawi', 5, '$300-$536',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Wellness', 4.25, 316, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-leaf-line|Eco-Friendly','ri-24-hours-line|24h Reception','ri-goblet-line|Rooftop Bar','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kuala Lumpur'),
  'Classic Kuala Lumpur Resort', '129 Royal Way, Kuala Lumpur', 4, '$90-$194',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Coastal', 4.97, 110, 'Best Value',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-building-line|Historic Building','ri-mountain-line|Mountain Views','ri-service-line|Concierge','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kuala Lumpur'),
  'Essence Kuala Lumpur Suites', '23 Park Rd, Kuala Lumpur', 5, '$300-$518',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Nature', 4.92, 271, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-service-line|Concierge','ri-tennis-ball-line|Tennis Court','ri-spa-line|Spa','ri-ship-line|Water Transport','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Penang'),
  'Heritage Penang Spa Resort', '89 Park Rd, Penang', 4, '$200-$391',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Nature', 4.23, 202, 'Best Value',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Penang'),
  'Golden Penang Collection', '96 Main St, Penang', 5, '$150-$257',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Iconic Cities', 4.97, 148, 'Iconic',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-car-line|Valet Parking','ri-building-line|Historic Building','ri-restaurant-2-line|Fine Dining','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Boracay'),
  'Villa Boracay Boutique Hotel', '190 Park Rd, Boracay', 5, '$70-$130',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Cultural', 4.76, 74, 'Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-swimming-pool-line|Pool','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Boracay'),
  'Pearl Boracay Resort', '93 Harbour Dr, Boracay', 4, '$150-$263',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Nature', 4.7, 142, 'Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-community-line|Co-working Space','ri-beach-line|Private Beach','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Palawan'),
  'Imperial Palawan Lodge', '67 Harbour Dr, Palawan', 3, '$150-$227',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
  'Wellness', 4.82, 147, 'Eco-Luxury',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-car-line|Valet Parking','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Palawan'),
  'Grand Palawan Hotel', '122 Grand Ave, Palawan', 4, '$350-$721',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Wellness', 4.84, 357, 'Iconic',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Manila'),
  'Aurora Manila Beach Resort', '160 Park Rd, Manila', 3, '$70-$130',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Wellness', 4.68, 71, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Manila'),
  'Premier Manila Collection', '67 Harbour Dr, Manila', 4, '$130-$208',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1445991842772-097fea258e7b?w=800',
  'Wellness', 4.52, 133, 'Best Value',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lombok'),
  'Azure Lombok House', '100 Harbour Dr, Lombok', 3, '$350-$698',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Cultural', 4.77, 346, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-garden-line|Garden','ri-goblet-line|Rooftop Bar','ri-beach-line|Private Beach','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lombok'),
  'Hotel Lombok Grand Hotel', '33 Harbour Dr, Lombok', 4, '$500-$1032',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Cultural', 4.72, 494, 'Eco-Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-shield-check-line|24h Security','ri-restaurant-line|Breakfast Included','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Raja Ampat'),
  'Pearl Raja Ampat Palace', '121 Main St, Raja Ampat', 3, '$250-$530',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Nature', 4.62, 266, 'Best Value',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-building-line|Historic Building','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Raja Ampat'),
  'Prestige Raja Ampat Lodge', '200 Main St, Raja Ampat', 5, '$180-$349',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Iconic Cities', 4.2, 181, 'Best Value',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-restaurant-2-line|Fine Dining','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Komodo'),
  'Horizon Komodo Boutique Hotel', '104 Park Rd, Komodo', 5, '$200-$300',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Cultural', 4.95, 251, 'Eco-Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Komodo'),
  'Heritage Komodo Retreat', '27 Park Rd, Komodo', 4, '$110-$170',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Cultural', 4.56, 121, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-24-hours-line|24h Reception','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jakarta'),
  'Maison Jakarta House', '5 Grand Ave, Jakarta', 4, '$500-$1094',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Iconic Cities', 4.67, 483, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jakarta'),
  'Summit Jakarta Resort', '153 Main St, Jakarta', 3, '$400-$834',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Iconic Cities', 4.53, 420, 'Iconic',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar','ri-building-line|Historic Building')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seminyak'),
  'Aurora Seminyak Palace', '170 Royal Way, Seminyak', 4, '$350-$673',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Iconic Cities', 4.6, 401, 'Iconic',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seminyak'),
  'Serene Seminyak Collection', '134 Grand Ave, Seminyak', 5, '$500-$893',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Wellness', 4.59, 491, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-tennis-ball-line|Tennis Court','ri-restaurant-2-line|Fine Dining','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='San Francisco'),
  'Luxe San Francisco Golf Resort', '172 Park Rd, San Francisco', 4, '$90-$184',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Iconic Cities', 4.91, 104, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-swimming-pool-line|Pool','ri-spa-line|Spa','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='San Francisco'),
  'Premier San Francisco Residences', '93 Old Town Square, San Francisco', 5, '$200-$403',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Iconic Cities', 4.21, 191, 'Best Value',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-restaurant-2-line|Fine Dining','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chicago'),
  'Maison Chicago Palace', '103 Park Rd, Chicago', 5, '$150-$312',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Coastal', 4.29, 176, 'Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-spa-line|Spa','ri-building-line|Historic Building','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chicago'),
  'Maison Chicago House', '200 Ocean Blvd, Chicago', 3, '$400-$846',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Nature', 4.29, 425, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi','ri-garden-line|Garden','ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Las Vegas'),
  'Silver Las Vegas Beach Resort', '177 Harbour Dr, Las Vegas', 3, '$200-$392',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Cultural', 4.72, 231, 'Best Value',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-beach-line|Private Beach','ri-garden-line|Garden')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Las Vegas'),
  'Premier Las Vegas Grand Hotel', '127 Old Town Square, Las Vegas', 4, '$90-$182',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Cultural', 4.97, 82, 'Eco-Luxury',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-leaf-line|Eco-Friendly','ri-restaurant-2-line|Fine Dining','ri-community-line|Co-working Space','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New Orleans'),
  'Prime New Orleans Luxury Hotel', '23 Old Town Square, New Orleans', 5, '$250-$430',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Iconic Cities', 4.28, 266, 'Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New Orleans'),
  'Elite New Orleans Inn', '168 Harbour Dr, New Orleans', 5, '$180-$315',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Nature', 4.46, 217, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-spa-line|Spa','ri-fitness-line|Gym','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seattle'),
  'Prestige Seattle Pavilion', '163 Old Town Square, Seattle', 4, '$300-$559',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Coastal', 4.59, 368, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-mountain-line|Mountain Views','ri-fitness-line|Gym','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seattle'),
  'Villa Seattle Luxury Hotel', '49 Harbour Dr, Seattle', 5, '$90-$182',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Wellness', 4.3, 113, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi','ri-garden-line|Garden','ri-swimming-pool-line|Pool')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Boston'),
  'Elite Boston Boutique Hotel', '150 Park Rd, Boston', 4, '$500-$952',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Nature', 4.72, 571, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Boston'),
  'Pearl Boston Retreat', '36 Park Rd, Boston', 4, '$500-$941',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Wellness', 4.7, 490, 'Iconic',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-service-line|Concierge','ri-beach-line|Private Beach','ri-garden-line|Garden','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Washington DC'),
  'Serene Washington DC Pavilion', '144 Park Rd, Washington DC', 5, '$400-$809',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Nature', 4.84, 443, 'Luxury',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-tennis-ball-line|Tennis Court','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Washington DC'),
  'Serene Washington DC Lodge', '74 Harbour Dr, Washington DC', 4, '$110-$229',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Wellness', 4.23, 134, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-map-pin-line|City Centre','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nashville'),
  'Tranquil Nashville Residences', '178 Harbour Dr, Nashville', 3, '$200-$354',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Iconic Cities', 4.21, 200, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-fitness-line|Gym','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nashville'),
  'Serene Nashville Inn', '76 Park Rd, Nashville', 4, '$400-$620',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Wellness', 4.29, 366, 'Iconic',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-service-line|Concierge','ri-beach-line|Private Beach','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi','ri-shield-check-line|24h Security')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Aspen'),
  'Pearl Aspen Retreat', '11 Grand Ave, Aspen', 5, '$350-$537',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Cultural', 4.59, 395, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-garden-line|Garden','ri-leaf-line|Eco-Friendly','ri-beach-line|Private Beach','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Aspen'),
  'Tranquil Aspen Beach Resort', '41 Park Rd, Aspen', 5, '$90-$157',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Cultural', 4.46, 91, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-spa-line|Spa','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jackson Hole'),
  'Resort Jackson Hole Manor', '11 Harbour Dr, Jackson Hole', 5, '$200-$428',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Cultural', 4.63, 202, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-mountain-line|Mountain Views','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jackson Hole'),
  'The Jackson Hole Palace', '43 Old Town Square, Jackson Hole', 3, '$400-$618',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Nature', 4.86, 392, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-service-line|Concierge','ri-wifi-line|Free WiFi','ri-community-line|Co-working Space')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hawaii'),
  'Haven Hawaii Villas', '10 Main St, Hawaii', 3, '$70-$113',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Iconic Cities', 4.65, 69, 'Iconic',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-map-pin-line|City Centre','ri-building-line|Historic Building','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hawaii'),
  'Aurora Hawaii Palace', '137 Main St, Hawaii', 3, '$500-$954',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Wellness', 4.28, 607, 'Iconic',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Puerto Rico'),
  'Signature Puerto Rico Hotel', '122 Grand Ave, Puerto Rico', 4, '$110-$222',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Coastal', 4.44, 138, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-spa-line|Spa','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi','ri-map-pin-line|City Centre')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Puerto Rico'),
  'Elite Puerto Rico Spa Resort', '22 Ocean Blvd, Puerto Rico', 4, '$500-$1009',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Nature', 4.92, 620, 'Best Value',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cancun'),
  'Maison Cancun Golf Resort', '14 Old Town Square, Cancun', 5, '$400-$753',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Iconic Cities', 4.4, 391, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-service-line|Concierge','ri-leaf-line|Eco-Friendly','ri-spa-line|Spa','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cancun'),
  'Classic Cancun Inn', '82 Park Rd, Cancun', 5, '$180-$347',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Wellness', 4.32, 202, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-shield-check-line|24h Security','ri-leaf-line|Eco-Friendly','ri-ship-line|Water Transport')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mexico City'),
  'Haven Mexico City Boutique Hotel', '71 Old Town Square, Mexico City', 5, '$110-$217',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Nature', 4.55, 133, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mexico City'),
  'Premier Mexico City Retreat', '138 Grand Ave, Mexico City', 4, '$500-$1060',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Iconic Cities', 4.9, 619, 'Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-mountain-line|Mountain Views','ri-swimming-pool-line|Pool','ri-car-line|Valet Parking','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Oaxaca'),
  'Serene Oaxaca Retreat', '94 Park Rd, Oaxaca', 4, '$350-$704',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Nature', 4.6, 327, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Oaxaca'),
  'Palace Oaxaca Luxury Hotel', '41 Grand Ave, Oaxaca', 4, '$500-$1006',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Coastal', 4.8, 496, 'Iconic',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-mountain-line|Mountain Views','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Guadalajara'),
  'Signature Guadalajara Grand Hotel', '117 Main St, Guadalajara', 3, '$400-$690',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Cultural', 4.86, 402, 'Best Value',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-fitness-line|Gym','ri-restaurant-2-line|Fine Dining','ri-garden-line|Garden','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Guadalajara'),
  'Resort Guadalajara Beach Resort', '104 Ocean Blvd, Guadalajara', 5, '$250-$513',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Wellness', 4.9, 268, 'Eco-Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-service-line|Concierge','ri-beach-line|Private Beach','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Los Cabos'),
  'Summit Los Cabos Palace', '170 Grand Ave, Los Cabos', 5, '$180-$360',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Nature', 4.58, 204, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-service-line|Concierge','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Los Cabos'),
  'Horizon Los Cabos Beach Resort', '11 Royal Way, Los Cabos', 4, '$70-$113',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Nature', 4.67, 78, 'Luxury',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-mountain-line|Mountain Views','ri-community-line|Co-working Space','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Panama City'),
  'Maison Panama City Manor', '106 Royal Way, Panama City', 4, '$350-$726',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Wellness', 4.41, 416, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-fitness-line|Gym','ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Panama City'),
  'Palace Panama City Palace', '5 Grand Ave, Panama City', 5, '$110-$211',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Wellness', 4.67, 137, 'Guest Favourite',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-service-line|Concierge','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi','ri-building-line|Historic Building','ri-garden-line|Garden','ri-beach-line|Private Beach')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cartagena'),
  'Premier Cartagena Resort', '179 Royal Way, Cartagena', 5, '$130-$280',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Nature', 4.48, 158, 'Guest Favourite',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-24-hours-line|24h Reception','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cartagena'),
  'Heritage Cartagena Spa Resort', '105 Ocean Blvd, Cartagena', 4, '$70-$139',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Wellness', 4.29, 63, 'Eco-Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-spa-line|Spa','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bogota'),
  'Horizon Bogota Golf Resort', '65 Ocean Blvd, Bogota', 5, '$350-$614',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Nature', 4.8, 372, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-tennis-ball-line|Tennis Court','ri-24-hours-line|24h Reception','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bogota'),
  'Prime Bogota Pavilion', '199 Harbour Dr, Bogota', 5, '$500-$798',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Coastal', 4.55, 589, 'Best Value',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-garden-line|Garden','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Medellín'),
  'Maison Medellín House', '163 Main St, Medellín', 3, '$110-$201',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Iconic Cities', 4.25, 108, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Medellín'),
  'Heritage Medellín Resort', '199 Old Town Square, Medellín', 4, '$400-$738',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Wellness', 4.43, 365, 'Eco-Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-restaurant-line|Breakfast Included','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Quito'),
  'Maison Quito Suites', '71 Old Town Square, Quito', 5, '$180-$354',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Coastal', 4.61, 215, 'Guest Favourite',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Quito'),
  'Prime Quito Pavilion', '89 Old Town Square, Quito', 4, '$130-$250',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Nature', 4.65, 130, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Galapagos'),
  'Heritage Galapagos Villas', '30 Old Town Square, Galapagos', 4, '$300-$620',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Nature', 4.96, 337, 'Eco-Luxury',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi','ri-24-hours-line|24h Reception','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Galapagos'),
  'Boutique Galapagos Suites', '98 Harbour Dr, Galapagos', 4, '$400-$796',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Cultural', 4.61, 361, 'Iconic',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-map-pin-line|City Centre','ri-shield-check-line|24h Security','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lima'),
  'Golden Lima Villas', '91 Grand Ave, Lima', 4, '$110-$237',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Coastal', 4.39, 109, 'Iconic',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-leaf-line|Eco-Friendly','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lima'),
  'Serene Lima Palace', '31 Main St, Lima', 5, '$350-$526',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Nature', 4.49, 359, 'Iconic',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-garden-line|Garden','ri-car-line|Valet Parking','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Machu Picchu'),
  'Serene Machu Picchu Golf Resort', '33 Main St, Machu Picchu', 5, '$250-$539',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Cultural', 4.51, 293, 'Best Value',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-garden-line|Garden','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Machu Picchu'),
  'Haven Machu Picchu Hotel', '4 Harbour Dr, Machu Picchu', 4, '$200-$381',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Wellness', 4.88, 194, 'Iconic',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-shield-check-line|24h Security','ri-restaurant-line|Breakfast Included','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cusco'),
  'Azure Cusco Inn', '108 Harbour Dr, Cusco', 5, '$180-$377',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Coastal', 4.65, 232, 'Eco-Luxury',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cusco'),
  'Azure Cusco House', '51 Grand Ave, Cusco', 4, '$250-$515',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Nature', 4.31, 314, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-car-line|Valet Parking','ri-ship-line|Water Transport','ri-swimming-pool-line|Pool','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='La Paz'),
  'Haven La Paz Lodge', '16 Grand Ave, La Paz', 4, '$250-$521',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Cultural', 4.41, 261, 'Iconic',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='La Paz'),
  'Premier La Paz Inn', '148 Royal Way, La Paz', 4, '$150-$262',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Nature', 4.9, 157, 'Iconic',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-shield-check-line|24h Security','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Salta'),
  'Premier Salta Suites', '21 Grand Ave, Salta', 5, '$130-$223',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Cultural', 4.68, 137, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-garden-line|Garden','ri-community-line|Co-working Space','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Salta'),
  'Maison Salta Hotel', '33 Harbour Dr, Salta', 4, '$400-$670',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Coastal', 4.51, 375, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-map-pin-line|City Centre','ri-garden-line|Garden')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mendoza'),
  'Serene Mendoza Suites', '27 Ocean Blvd, Mendoza', 4, '$90-$176',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Coastal', 4.4, 91, 'Best Value',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-swimming-pool-line|Pool','ri-restaurant-line|Breakfast Included','ri-shield-check-line|24h Security')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mendoza'),
  'Premier Mendoza Grand Hotel', '120 Old Town Square, Mendoza', 4, '$300-$543',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Wellness', 4.67, 345, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-24-hours-line|24h Reception','ri-ship-line|Water Transport','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bariloche'),
  'Pearl Bariloche Residences', '94 Park Rd, Bariloche', 4, '$110-$188',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Coastal', 4.47, 119, 'Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi','ri-building-line|Historic Building','ri-fitness-line|Gym','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bariloche'),
  'Resort Bariloche Hotel', '141 Ocean Blvd, Bariloche', 4, '$200-$423',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Coastal', 4.33, 238, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-restaurant-2-line|Fine Dining','ri-building-line|Historic Building','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Punta del Este'),
  'Serene Punta del Este Collection', '73 Harbour Dr, Punta del Este', 4, '$200-$326',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Coastal', 4.43, 230, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi','ri-service-line|Concierge','ri-swimming-pool-line|Pool','ri-car-line|Valet Parking')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Punta del Este'),
  'Grand Punta del Este Lodge', '27 Ocean Blvd, Punta del Este', 4, '$110-$220',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Iconic Cities', 4.32, 120, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-restaurant-line|Breakfast Included','ri-community-line|Co-working Space','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Montevideo'),
  'The Montevideo Retreat', '15 Ocean Blvd, Montevideo', 5, '$90-$169',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Cultural', 4.85, 110, 'Guest Favourite',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-community-line|Co-working Space','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Montevideo'),
  'Villa Montevideo Luxury Hotel', '189 Old Town Square, Montevideo', 3, '$300-$589',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Nature', 4.74, 307, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Santiago'),
  'Boutique Santiago Grand Hotel', '164 Ocean Blvd, Santiago', 4, '$180-$381',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Coastal', 4.7, 185, 'Best Value',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-spa-line|Spa','ri-map-pin-line|City Centre','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Santiago'),
  'Royal Santiago Golf Resort', '177 Park Rd, Santiago', 4, '$180-$367',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
  'Nature', 4.27, 206, 'Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-service-line|Concierge','ri-ship-line|Water Transport','ri-spa-line|Spa','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Valparaiso'),
  'Resort Valparaiso Villas', '143 Old Town Square, Valparaiso', 5, '$250-$503',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Nature', 4.48, 238, 'Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-goblet-line|Rooftop Bar','ri-tennis-ball-line|Tennis Court','ri-24-hours-line|24h Reception','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Valparaiso'),
  'Maison Valparaiso Spa Resort', '90 Ocean Blvd, Valparaiso', 5, '$150-$316',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Coastal', 4.25, 144, 'Iconic',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-restaurant-line|Breakfast Included','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi','ri-map-pin-line|City Centre')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sao Paulo'),
  'Essence Sao Paulo Lodge', '5 Royal Way, Sao Paulo', 5, '$350-$583',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Wellness', 4.85, 341, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-goblet-line|Rooftop Bar','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sao Paulo'),
  'Horizon Sao Paulo Villas', '29 Main St, Sao Paulo', 3, '$70-$145',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Iconic Cities', 4.36, 76, 'Guest Favourite',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-garden-line|Garden','ri-car-line|Valet Parking','ri-swimming-pool-line|Pool','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Salvador'),
  'Summit Salvador Suites', '4 Grand Ave, Salvador', 5, '$90-$164',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Wellness', 4.79, 113, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Salvador'),
  'Royal Salvador Suites', '78 Main St, Salvador', 4, '$300-$470',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Nature', 4.35, 333, 'Eco-Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-tennis-ball-line|Tennis Court','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Florianopolis'),
  'Serene Florianopolis Golf Resort', '92 Harbour Dr, Florianopolis', 5, '$500-$982',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
  'Coastal', 4.63, 550, 'Best Value',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-shield-check-line|24h Security','ri-ship-line|Water Transport','ri-fitness-line|Gym','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Florianopolis'),
  'Serene Florianopolis Boutique Hotel', '186 Ocean Blvd, Florianopolis', 4, '$350-$658',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Wellness', 4.93, 350, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-tennis-ball-line|Tennis Court','ri-service-line|Concierge','ri-community-line|Co-working Space')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Belize City'),
  'Heritage Belize City Hotel', '77 Grand Ave, Belize City', 4, '$180-$272',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Wellness', 4.64, 228, 'Best Value',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Belize City'),
  'Palace Belize City Collection', '94 Royal Way, Belize City', 4, '$130-$218',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Wellness', 4.52, 164, 'Guest Favourite',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-tennis-ball-line|Tennis Court','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='San José'),
  'Royal San José Golf Resort', '98 Main St, San José', 3, '$180-$313',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Iconic Cities', 4.89, 178, 'Luxury',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-garden-line|Garden','ri-tennis-ball-line|Tennis Court','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='San José'),
  'Prime San José Retreat', '84 Royal Way, San José', 4, '$110-$168',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Wellness', 4.65, 102, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-service-line|Concierge','ri-tennis-ball-line|Tennis Court','ri-shield-check-line|24h Security','ri-restaurant-2-line|Fine Dining','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Monteverde'),
  'Essence Monteverde Resort', '141 Park Rd, Monteverde', 4, '$90-$160',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Coastal', 4.8, 98, 'Eco-Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-mountain-line|Mountain Views','ri-ship-line|Water Transport','ri-garden-line|Garden','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Monteverde'),
  'The Monteverde Collection', '199 Park Rd, Monteverde', 5, '$400-$858',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Nature', 4.53, 415, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Havana'),
  'Summit Havana Luxury Hotel', '160 Grand Ave, Havana', 5, '$70-$150',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Cultural', 4.32, 83, 'Guest Favourite',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Havana'),
  'Grand Havana Villas', '178 Old Town Square, Havana', 3, '$150-$272',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800',
  'Coastal', 4.78, 147, 'Iconic',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-service-line|Concierge','ri-wifi-line|Free WiFi','ri-map-pin-line|City Centre','ri-swimming-pool-line|Pool','ri-fitness-line|Gym')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jamaica'),
  'Maison Jamaica Resort', '73 Grand Ave, Jamaica', 4, '$70-$127',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Nature', 4.72, 81, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar','ri-map-pin-line|City Centre')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Jamaica'),
  'Resort Jamaica House', '131 Harbour Dr, Jamaica', 3, '$180-$331',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Iconic Cities', 4.35, 198, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Barbados'),
  'Heritage Barbados Villas', '126 Park Rd, Barbados', 4, '$70-$121',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Cultural', 4.39, 90, 'Iconic',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Barbados'),
  'Elite Barbados Collection', '58 Grand Ave, Barbados', 5, '$200-$391',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Nature', 4.61, 234, 'Eco-Luxury',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-service-line|Concierge','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='St Lucia'),
  'Summit St Lucia Villas', '115 Royal Way, St Lucia', 4, '$130-$254',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Coastal', 4.88, 133, 'Best Value',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-beach-line|Private Beach','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='St Lucia'),
  'Elite St Lucia Spa Resort', '185 Main St, St Lucia', 4, '$180-$375',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800',
  'Iconic Cities', 4.8, 225, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-service-line|Concierge','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Turks and Caicos'),
  'Palace Turks and Caicos Lodge', '7 Old Town Square, Turks and Caicos', 4, '$350-$663',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Coastal', 4.38, 318, 'Guest Favourite',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-service-line|Concierge','ri-garden-line|Garden','ri-24-hours-line|24h Reception','ri-restaurant-line|Breakfast Included','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Turks and Caicos'),
  'Signature Turks and Caicos Grand Hotel', '122 Grand Ave, Turks and Caicos', 4, '$130-$215',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Iconic Cities', 4.93, 166, 'Eco-Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-restaurant-2-line|Fine Dining','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nassau'),
  'Premier Nassau Grand Hotel', '177 Ocean Blvd, Nassau', 5, '$130-$233',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Nature', 4.77, 137, 'Luxury',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nassau'),
  'Classic Nassau Manor', '133 Royal Way, Nassau', 5, '$500-$763',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Iconic Cities', 4.35, 537, 'Iconic',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-beach-line|Private Beach','ri-building-line|Historic Building','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Antigua'),
  'Haven Antigua Beach Resort', '37 Park Rd, Antigua', 5, '$90-$180',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Wellness', 4.94, 106, 'Best Value',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi','ri-beach-line|Private Beach','ri-fitness-line|Gym','ri-goblet-line|Rooftop Bar')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Antigua'),
  'Classic Antigua Inn', '117 Main St, Antigua', 4, '$180-$357',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Iconic Cities', 4.27, 212, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-garden-line|Garden','ri-beach-line|Private Beach','ri-map-pin-line|City Centre','ri-ship-line|Water Transport','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cape Town'),
  'Maison Cape Town Villas', '145 Old Town Square, Cape Town', 4, '$110-$231',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Iconic Cities', 4.53, 112, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-spa-line|Spa','ri-service-line|Concierge','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cape Town'),
  'Summit Cape Town Collection', '4 Park Rd, Cape Town', 5, '$250-$470',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Nature', 4.39, 283, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi','ri-leaf-line|Eco-Friendly','ri-car-line|Valet Parking','ri-goblet-line|Rooftop Bar')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Johannesburg'),
  'Horizon Johannesburg Spa Resort', '54 Main St, Johannesburg', 4, '$110-$169',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Coastal', 4.87, 128, 'Iconic',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Johannesburg'),
  'Maison Johannesburg Lodge', '173 Ocean Blvd, Johannesburg', 4, '$250-$506',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Iconic Cities', 4.81, 257, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Durban'),
  'Heritage Durban Grand Hotel', '35 Main St, Durban', 4, '$180-$336',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Coastal', 4.68, 169, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-shield-check-line|24h Security','ri-car-line|Valet Parking','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Durban'),
  'Palace Durban Golf Resort', '128 Royal Way, Durban', 5, '$250-$516',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Cultural', 4.97, 225, 'Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nairobi'),
  'Royal Nairobi Villas', '90 Royal Way, Nairobi', 4, '$70-$136',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Iconic Cities', 4.44, 77, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-spa-line|Spa','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nairobi'),
  'Signature Nairobi Golf Resort', '158 Main St, Nairobi', 4, '$130-$225',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Nature', 4.92, 158, 'Best Value',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-ship-line|Water Transport','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Zanzibar'),
  'Tranquil Zanzibar Boutique Hotel', '191 Main St, Zanzibar', 4, '$350-$702',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Wellness', 4.21, 395, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-service-line|Concierge','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi','ri-shield-check-line|24h Security')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Zanzibar'),
  'Signature Zanzibar Spa Resort', '43 Royal Way, Zanzibar', 5, '$110-$210',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Cultural', 4.76, 110, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-community-line|Co-working Space','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dar es Salaam'),
  'Silver Dar es Salaam Residences', '45 Main St, Dar es Salaam', 5, '$70-$143',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Wellness', 4.22, 76, 'Best Value',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-garden-line|Garden','ri-goblet-line|Rooftop Bar','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dar es Salaam'),
  'Serene Dar es Salaam Palace', '133 Harbour Dr, Dar es Salaam', 4, '$130-$260',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Wellness', 4.29, 133, 'Luxury',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kigali'),
  'Hotel Kigali Beach Resort', '197 Harbour Dr, Kigali', 4, '$70-$133',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Coastal', 4.45, 68, 'Iconic',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-spa-line|Spa','ri-car-line|Valet Parking','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kigali'),
  'Boutique Kigali Palace', '4 Royal Way, Kigali', 3, '$130-$244',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Cultural', 4.31, 153, 'Iconic',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-restaurant-2-line|Fine Dining','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bwindi'),
  'Elite Bwindi Luxury Hotel', '13 Grand Ave, Bwindi', 3, '$250-$533',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Nature', 4.24, 267, 'Best Value',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-restaurant-line|Breakfast Included','ri-goblet-line|Rooftop Bar','ri-shield-check-line|24h Security','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bwindi'),
  'Serene Bwindi Spa Resort', '21 Old Town Square, Bwindi', 5, '$350-$557',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=800',
  'Nature', 4.45, 405, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-service-line|Concierge','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kampala'),
  'Signature Kampala Lodge', '180 Harbour Dr, Kampala', 5, '$180-$327',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Nature', 4.29, 196, 'Best Value',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-fitness-line|Gym','ri-service-line|Concierge','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Kampala'),
  'Signature Kampala Palace', '84 Royal Way, Kampala', 3, '$150-$280',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Nature', 4.39, 149, 'Best Value',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-shield-check-line|24h Security','ri-mountain-line|Mountain Views','ri-building-line|Historic Building','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Accra'),
  'Tranquil Accra Villas', '140 Harbour Dr, Accra', 4, '$110-$216',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Wellness', 4.86, 104, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Accra'),
  'Signature Accra Suites', '154 Main St, Accra', 5, '$180-$332',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Coastal', 4.85, 225, 'Luxury',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-service-line|Concierge','ri-community-line|Co-working Space','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lagos'),
  'Signature Lagos Golf Resort', '115 Grand Ave, Lagos', 4, '$400-$845',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Cultural', 4.93, 509, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lagos'),
  'Premier Lagos Retreat', '76 Main St, Lagos', 5, '$300-$653',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Wellness', 4.85, 313, 'Iconic',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Abidjan'),
  'Horizon Abidjan Villas', '183 Park Rd, Abidjan', 5, '$200-$360',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Coastal', 4.58, 195, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-service-line|Concierge','ri-goblet-line|Rooftop Bar','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Abidjan'),
  'Grand Abidjan Suites', '166 Main St, Abidjan', 4, '$500-$1059',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Iconic Cities', 4.31, 611, NULL,
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-beach-line|Private Beach','ri-community-line|Co-working Space','ri-garden-line|Garden','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dakar'),
  'Luxe Dakar Luxury Hotel', '99 Ocean Blvd, Dakar', 4, '$110-$197',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Nature', 4.87, 109, 'Iconic',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-tennis-ball-line|Tennis Court','ri-24-hours-line|24h Reception','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dakar'),
  'Prime Dakar Grand Hotel', '177 Main St, Dakar', 4, '$500-$1005',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Wellness', 4.26, 627, 'Guest Favourite',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-ship-line|Water Transport','ri-goblet-line|Rooftop Bar','ri-swimming-pool-line|Pool','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Addis Ababa'),
  'Serene Addis Ababa Hotel', '121 Park Rd, Addis Ababa', 5, '$350-$704',
  0.0000, 0.0000,
  'Eco-luxury treehouses in the rainforest',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Cultural', 4.43, 319, 'Iconic',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Addis Ababa'),
  'Tranquil Addis Ababa Hotel', '74 Park Rd, Addis Ababa', 3, '$110-$203',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Coastal', 4.69, 111, 'Iconic',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lalibela'),
  'Aurora Lalibela Luxury Hotel', '95 Old Town Square, Lalibela', 4, '$150-$307',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Coastal', 4.83, 186, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-service-line|Concierge','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lalibela'),
  'Serene Lalibela House', '61 Harbour Dr, Lalibela', 5, '$500-$973',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Cultural', 4.24, 502, 'Guest Favourite',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-map-pin-line|City Centre','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Victoria Falls'),
  'Golden Victoria Falls Spa Resort', '60 Park Rd, Victoria Falls', 5, '$250-$420',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Iconic Cities', 4.43, 304, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-garden-line|Garden','ri-swimming-pool-line|Pool','ri-spa-line|Spa','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Victoria Falls'),
  'Summit Victoria Falls Collection', '86 Ocean Blvd, Victoria Falls', 4, '$90-$151',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Nature', 4.81, 107, 'Eco-Luxury',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-shield-check-line|24h Security','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi','ri-garden-line|Garden')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hwange'),
  'Luxe Hwange Suites', '4 Park Rd, Hwange', 3, '$300-$471',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Coastal', 4.77, 300, 'Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hwange'),
  'Haven Hwange Palace', '23 Old Town Square, Hwange', 4, '$200-$391',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Iconic Cities', 4.75, 200, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chobe'),
  'Haven Chobe Villas', '66 Grand Ave, Chobe', 3, '$150-$306',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Cultural', 4.99, 150, 'Iconic',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-24-hours-line|24h Reception','ri-mountain-line|Mountain Views','ri-map-pin-line|City Centre','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chobe'),
  'Golden Chobe Palace', '37 Royal Way, Chobe', 5, '$130-$250',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Cultural', 4.28, 120, 'Iconic',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-24-hours-line|24h Reception','ri-service-line|Concierge','ri-tennis-ball-line|Tennis Court','ri-swimming-pool-line|Pool','ri-shield-check-line|24h Security')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Okavango'),
  'Signature Okavango Collection', '39 Harbour Dr, Okavango', 5, '$200-$380',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Nature', 4.58, 212, 'Guest Favourite',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-map-pin-line|City Centre','ri-24-hours-line|24h Reception','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Okavango'),
  'Prime Okavango Spa Resort', '92 Ocean Blvd, Okavango', 4, '$200-$307',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
  'Wellness', 4.87, 207, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-beach-line|Private Beach','ri-ship-line|Water Transport','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Windhoek'),
  'Aurora Windhoek Inn', '77 Harbour Dr, Windhoek', 5, '$90-$174',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Iconic Cities', 4.9, 96, 'Eco-Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi','ri-leaf-line|Eco-Friendly')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Windhoek'),
  'Golden Windhoek House', '17 Old Town Square, Windhoek', 4, '$250-$468',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Iconic Cities', 4.47, 258, 'Luxury',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sossusvlei'),
  'Aurora Sossusvlei Spa Resort', '39 Harbour Dr, Sossusvlei', 4, '$90-$137',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Iconic Cities', 4.57, 114, 'Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-beach-line|Private Beach','ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sossusvlei'),
  'Luxe Sossusvlei Palace', '117 Royal Way, Sossusvlei', 4, '$350-$540',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Nature', 4.67, 401, 'Guest Favourite',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-shield-check-line|24h Security','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lamu'),
  'Hotel Lamu Golf Resort', '140 Grand Ave, Lamu', 5, '$130-$264',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Cultural', 4.25, 131, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-beach-line|Private Beach','ri-community-line|Co-working Space','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lamu'),
  'Palace Lamu Palace', '162 Royal Way, Lamu', 5, '$110-$166',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Iconic Cities', 4.21, 139, 'Iconic',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-service-line|Concierge','ri-mountain-line|Mountain Views','ri-tennis-ball-line|Tennis Court','ri-car-line|Valet Parking','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amboseli'),
  'Resort Amboseli Lodge', '157 Harbour Dr, Amboseli', 3, '$350-$569',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Iconic Cities', 4.7, 424, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amboseli'),
  'Hotel Amboseli Beach Resort', '25 Royal Way, Amboseli', 5, '$300-$556',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Coastal', 4.42, 293, 'Best Value',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-fitness-line|Gym','ri-swimming-pool-line|Pool','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seychelles'),
  'Imperial Seychelles Residences', '54 Park Rd, Seychelles', 4, '$180-$347',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Iconic Cities', 4.78, 228, 'Best Value',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Seychelles'),
  'The Seychelles Manor', '185 Park Rd, Seychelles', 5, '$200-$327',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Iconic Cities', 4.46, 187, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-leaf-line|Eco-Friendly','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mauritius'),
  'Prime Mauritius Grand Hotel', '14 Park Rd, Mauritius', 4, '$130-$279',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Nature', 4.5, 140, 'Eco-Luxury',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-shield-check-line|24h Security','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mauritius'),
  'Haven Mauritius Golf Resort', '16 Ocean Blvd, Mauritius', 4, '$90-$188',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Coastal', 4.8, 88, 'Iconic',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-beach-line|Private Beach','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Reunion'),
  'The Reunion Boutique Hotel', '134 Park Rd, Reunion', 4, '$350-$641',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  'Iconic Cities', 4.78, 418, 'Eco-Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-fitness-line|Gym','ri-leaf-line|Eco-Friendly','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Reunion'),
  'Azure Reunion Resort', '11 Park Rd, Reunion', 3, '$200-$374',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Iconic Cities', 4.56, 199, 'Luxury',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-service-line|Concierge','ri-restaurant-line|Breakfast Included','ri-goblet-line|Rooftop Bar','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Antananarivo'),
  'The Antananarivo Hotel', '123 Harbour Dr, Antananarivo', 4, '$110-$219',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=800',
  'Wellness', 4.22, 119, 'Best Value',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-restaurant-line|Breakfast Included','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi','ri-restaurant-2-line|Fine Dining','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Antananarivo'),
  'Classic Antananarivo Villas', '136 Main St, Antananarivo', 4, '$200-$405',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800',
  'Wellness', 4.83, 243, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-garden-line|Garden','ri-restaurant-line|Breakfast Included','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nosy Be'),
  'Signature Nosy Be Pavilion', '120 Royal Way, Nosy Be', 3, '$180-$316',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?w=800',
  'Iconic Cities', 4.64, 217, 'Best Value',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-spa-line|Spa','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Nosy Be'),
  'Serene Nosy Be Manor', '83 Ocean Blvd, Nosy Be', 4, '$300-$592',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1445991842772-097fea258e7b?w=800',
  'Iconic Cities', 4.49, 324, 'Guest Favourite',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-restaurant-line|Breakfast Included','ri-restaurant-2-line|Fine Dining','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sydney'),
  'The Sydney Suites', '101 Grand Ave, Sydney', 4, '$90-$141',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Coastal', 4.59, 112, 'Luxury',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-service-line|Concierge','ri-24-hours-line|24h Reception','ri-restaurant-line|Breakfast Included','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Sydney'),
  'Essence Sydney Hotel', '75 Grand Ave, Sydney', 3, '$70-$147',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Cultural', 4.53, 72, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-goblet-line|Rooftop Bar','ri-service-line|Concierge','ri-fitness-line|Gym','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Melbourne'),
  'Boutique Melbourne Manor', '124 Ocean Blvd, Melbourne', 4, '$70-$112',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Coastal', 4.69, 67, 'Iconic',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-service-line|Concierge','ri-beach-line|Private Beach','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Melbourne'),
  'Royal Melbourne Villas', '148 Grand Ave, Melbourne', 5, '$150-$263',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1531088009183-5ff5b7c95f91?w=800',
  'Iconic Cities', 4.73, 193, 'Best Value',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-beach-line|Private Beach','ri-tennis-ball-line|Tennis Court','ri-goblet-line|Rooftop Bar','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Brisbane'),
  'Grand Brisbane House', '128 Old Town Square, Brisbane', 4, '$250-$537',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Wellness', 4.97, 258, 'Iconic',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-service-line|Concierge','ri-community-line|Co-working Space','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Brisbane'),
  'Essence Brisbane Grand Hotel', '11 Grand Ave, Brisbane', 3, '$150-$227',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Nature', 4.48, 154, 'Eco-Luxury',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi','ri-restaurant-2-line|Fine Dining')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cairns'),
  'Elite Cairns Luxury Hotel', '174 Harbour Dr, Cairns', 3, '$300-$532',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Wellness', 4.68, 383, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Cairns'),
  'Grand Cairns Residences', '89 Ocean Blvd, Cairns', 4, '$250-$528',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Nature', 4.79, 266, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-tennis-ball-line|Tennis Court','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Uluru'),
  'Palace Uluru Inn', '78 Park Rd, Uluru', 5, '$90-$193',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Nature', 4.27, 95, 'Iconic',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-community-line|Co-working Space','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Uluru'),
  'Maison Uluru House', '75 Royal Way, Uluru', 5, '$70-$145',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Cultural', 4.59, 83, 'Eco-Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-service-line|Concierge','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Perth'),
  'Horizon Perth Grand Hotel', '32 Harbour Dr, Perth', 4, '$200-$325',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Iconic Cities', 4.8, 219, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-24-hours-line|24h Reception','ri-building-line|Historic Building','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Perth'),
  'Haven Perth Palace', '96 Royal Way, Perth', 3, '$150-$242',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Cultural', 4.56, 176, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Gold Coast'),
  'Horizon Gold Coast Pavilion', '13 Ocean Blvd, Gold Coast', 4, '$300-$584',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Coastal', 4.81, 291, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-shield-check-line|24h Security','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Gold Coast'),
  'Boutique Gold Coast Pavilion', '25 Royal Way, Gold Coast', 5, '$110-$165',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Cultural', 4.82, 117, 'Best Value',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-service-line|Concierge','ri-garden-line|Garden','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Whitsundays'),
  'Tranquil Whitsundays Spa Resort', '158 Harbour Dr, Whitsundays', 3, '$200-$364',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Coastal', 4.93, 218, 'Iconic',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-service-line|Concierge','ri-community-line|Co-working Space','ri-garden-line|Garden','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Whitsundays'),
  'Haven Whitsundays Residences', '8 Harbour Dr, Whitsundays', 3, '$130-$206',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800',
  'Coastal', 4.44, 127, 'Guest Favourite',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi','ri-24-hours-line|24h Reception')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Auckland'),
  'Serene Auckland Boutique Hotel', '11 Grand Ave, Auckland', 3, '$70-$143',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Iconic Cities', 4.57, 88, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-spa-line|Spa','ri-fitness-line|Gym','ri-mountain-line|Mountain Views','ri-garden-line|Garden')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Auckland'),
  'Maison Auckland Pavilion', '8 Main St, Auckland', 4, '$500-$1079',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800',
  'Cultural', 4.33, 550, 'Eco-Luxury',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-spa-line|Spa','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Queenstown'),
  'Silver Queenstown Inn', '184 Grand Ave, Queenstown', 4, '$110-$234',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1542314831-c6a4d1409e1f?w=800',
  'Iconic Cities', 4.93, 139, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-spa-line|Spa','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Queenstown'),
  'Signature Queenstown Boutique Hotel', '55 Royal Way, Queenstown', 4, '$200-$315',
  0.0000, 0.0000,
  'Seafront villa with infinity pool',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Nature', 4.29, 190, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-swimming-pool-line|Pool','ri-restaurant-2-line|Fine Dining','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rotorua'),
  'Hotel Rotorua House', '73 Park Rd, Rotorua', 4, '$400-$873',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Wellness', 4.52, 517, NULL,
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rotorua'),
  'Grand Rotorua Grand Hotel', '173 Main St, Rotorua', 5, '$250-$466',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Coastal', 4.51, 294, 'Guest Favourite',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-restaurant-line|Breakfast Included','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Christchurch'),
  'Villa Christchurch House', '32 Grand Ave, Christchurch', 5, '$500-$924',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Cultural', 4.8, 610, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-tennis-ball-line|Tennis Court','ri-map-pin-line|City Centre','ri-24-hours-line|24h Reception','ri-garden-line|Garden','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Christchurch'),
  'Serene Christchurch Luxury Hotel', '28 Main St, Christchurch', 4, '$250-$462',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Iconic Cities', 4.78, 308, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-map-pin-line|City Centre','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Fiji'),
  'Palace Fiji Residences', '160 Royal Way, Fiji', 3, '$90-$176',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Nature', 4.83, 88, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-shield-check-line|24h Security','ri-tennis-ball-line|Tennis Court','ri-wifi-line|Free WiFi','ri-swimming-pool-line|Pool')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Fiji'),
  'Azure Fiji Palace', '99 Park Rd, Fiji', 5, '$200-$361',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Coastal', 4.64, 248, 'Iconic',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-building-line|Historic Building','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bora Bora'),
  'Haven Bora Bora House', '125 Old Town Square, Bora Bora', 3, '$350-$690',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1523805009345-7448845a9e53?w=800',
  'Wellness', 4.65, 381, 'Best Value',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bora Bora'),
  'Prime Bora Bora House', '158 Harbour Dr, Bora Bora', 5, '$150-$258',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Iconic Cities', 4.3, 156, 'Luxury',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-spa-line|Spa','ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Moorea'),
  'Azure Moorea Pavilion', '15 Harbour Dr, Moorea', 4, '$130-$216',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Iconic Cities', 4.92, 120, 'Iconic',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-wifi-line|Free WiFi','ri-ship-line|Water Transport','ri-shield-check-line|24h Security','ri-swimming-pool-line|Pool')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Moorea'),
  'Pearl Moorea Boutique Hotel', '146 Royal Way, Moorea', 5, '$150-$227',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Iconic Cities', 4.98, 157, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Samoa'),
  'Prestige Samoa Grand Hotel', '129 Old Town Square, Samoa', 5, '$110-$212',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1474823920853-3bd72739f3cb?w=800',
  'Coastal', 4.59, 136, 'Guest Favourite',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-car-line|Valet Parking','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Samoa'),
  'Prime Samoa House', '58 Royal Way, Samoa', 3, '$500-$1045',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?w=800',
  'Cultural', 4.42, 563, NULL,
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-restaurant-2-line|Fine Dining','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tonga'),
  'Tranquil Tonga Residences', '111 Harbour Dr, Tonga', 5, '$130-$232',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=800',
  'Wellness', 4.56, 156, 'Best Value',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-garden-line|Garden','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tonga'),
  'Villa Tonga Luxury Hotel', '69 Harbour Dr, Tonga', 5, '$350-$703',
  0.0000, 0.0000,
  'Beachfront escape with private access',
  'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=800',
  'Coastal', 4.49, 335, 'Best Value',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-tennis-ball-line|Tennis Court','ri-shield-check-line|24h Security','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Palau'),
  'Premier Palau Boutique Hotel', '69 Old Town Square, Palau', 4, '$400-$644',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Nature', 4.39, 383, 'Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-24-hours-line|24h Reception','ri-ship-line|Water Transport','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Palau'),
  'Horizon Palau Resort', '52 Grand Ave, Palau', 4, '$110-$167',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=800',
  'Wellness', 4.34, 136, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Vanuatu'),
  'Summit Vanuatu Residences', '17 Park Rd, Vanuatu', 5, '$400-$784',
  0.0000, 0.0000,
  'Historic palace reimagined for modern travellers',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Coastal', 4.39, 451, 'Guest Favourite',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Vanuatu'),
  'Prestige Vanuatu Golf Resort', '189 Park Rd, Vanuatu', 4, '$200-$330',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1535498730771-e735b998cd47?w=800',
  'Coastal', 4.97, 215, 'Iconic',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New Caledonia'),
  'Haven New Caledonia Palace', '82 Royal Way, New Caledonia', 5, '$250-$494',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Cultural', 4.58, 261, 'Iconic',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='New Caledonia'),
  'Elite New Caledonia House', '80 Harbour Dr, New Caledonia', 5, '$400-$634',
  0.0000, 0.0000,
  'Mountain lodge above the clouds',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Nature', 4.21, 513, 'Iconic',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Marrakech'),
  'Villa Marrakech Collection', '74 Harbour Dr, Marrakech', 5, '$200-$318',
  0.0000, 0.0000,
  'Desert oasis with stargazing terraces',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Coastal', 4.99, 202, 'Eco-Luxury',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-service-line|Concierge','ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Torres del Paine'),
  'Boutique Torres del Paine Manor', '159 Park Rd, Torres del Paine', 4, '$180-$343',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Iconic Cities', 4.57, 224, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-building-line|Historic Building','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Buenos Aires'),
  'Hotel Buenos Aires Spa Resort', '16 Main St, Buenos Aires', 5, '$130-$237',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1518623489648-a173ef7824f3?w=800',
  'Wellness', 4.76, 159, 'Luxury',
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-map-pin-line|City Centre','ri-restaurant-line|Breakfast Included','ri-service-line|Concierge','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hong Kong'),
  'Maison Hong Kong Collection', '44 Royal Way, Hong Kong', 5, '$180-$380',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Cultural', 4.76, 193, 'Iconic',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-swimming-pool-line|Pool','ri-service-line|Concierge','ri-24-hours-line|24h Reception','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Canyon Point'),
  'Azure Canyon Point Residences', '68 Royal Way, Canyon Point', 4, '$300-$515',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Nature', 4.8, 288, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-service-line|Concierge','ri-swimming-pool-line|Pool','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Amman'),
  'Royal Amman Grand Hotel', '67 Grand Ave, Amman', 5, '$200-$316',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Nature', 4.48, 236, NULL,
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-spa-line|Spa','ri-service-line|Concierge','ri-tennis-ball-line|Tennis Court','ri-restaurant-line|Breakfast Included','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tulum'),
  'Premier Tulum Residences', '47 Old Town Square, Tulum', 4, '$500-$928',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Wellness', 4.37, 649, 'Luxury',
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-restaurant-2-line|Fine Dining','ri-leaf-line|Eco-Friendly','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Los Angeles'),
  'Aurora Los Angeles Palace', '85 Main St, Los Angeles', 4, '$400-$874',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800',
  'Cultural', 4.67, 512, NULL,
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ngorongoro'),
  'Pearl Ngorongoro Collection', '153 Harbour Dr, Ngorongoro', 3, '$180-$392',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Cultural', 4.95, 233, 'Best Value',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Buenos Aires'),
  'Essence Buenos Aires Suites', '141 Royal Way, Buenos Aires', 5, '$90-$160',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Nature', 4.27, 111, 'Best Value',
  'Perfectly positioned for exploring the region, with expert guides and bespoke excursions on hand.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-service-line|Concierge','ri-spa-line|Spa','ri-tennis-ball-line|Tennis Court','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Muscat'),
  'Azure Muscat Residences', '176 Royal Way, Muscat', 4, '$180-$353',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=800',
  'Coastal', 4.59, 225, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-building-line|Historic Building','ri-restaurant-line|Breakfast Included','ri-beach-line|Private Beach','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Miami'),
  'Azure Miami Suites', '11 Royal Way, Miami', 5, '$250-$493',
  0.0000, 0.0000,
  'Jungle hideaway surrounded by nature',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Wellness', 4.7, 277, 'Iconic',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-24-hours-line|24h Reception','ri-goblet-line|Rooftop Bar','ri-service-line|Concierge','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Los Angeles'),
  'Classic Los Angeles Residences', '64 Royal Way, Los Angeles', 5, '$150-$284',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800',
  'Iconic Cities', 4.61, 165, NULL,
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-car-line|Valet Parking','ri-restaurant-line|Breakfast Included','ri-tennis-ball-line|Tennis Court','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ain Sokhna'),
  'Silver Ain Sokhna Hotel', '30 Harbour Dr, Ain Sokhna', 5, '$110-$225',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Iconic Cities', 4.53, 129, NULL,
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-car-line|Valet Parking','ri-shield-check-line|24h Security','ri-beach-line|Private Beach','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Barcelona'),
  'The Barcelona Collection', '173 Main St, Barcelona', 5, '$300-$453',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Iconic Cities', 4.34, 327, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-restaurant-line|Breakfast Included','ri-map-pin-line|City Centre','ri-tennis-ball-line|Tennis Court','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Paris'),
  'Palace Paris Hotel', '49 Main St, Paris', 3, '$500-$1089',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1544124499-58912cbddaad?w=800',
  'Nature', 4.71, 579, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-goblet-line|Rooftop Bar','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chiang Rai'),
  'Golden Chiang Rai Boutique Hotel', '6 Main St, Chiang Rai', 4, '$110-$221',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=800',
  'Nature', 4.22, 118, 'Eco-Luxury',
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-fitness-line|Gym','ri-map-pin-line|City Centre','ri-swimming-pool-line|Pool','ri-shield-check-line|24h Security','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Paris'),
  'Hotel Paris Boutique Hotel', '107 Old Town Square, Paris', 5, '$500-$952',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Iconic Cities', 4.59, 547, NULL,
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-garden-line|Garden','ri-wifi-line|Free WiFi','ri-building-line|Historic Building')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Ngorongoro'),
  'Prime Ngorongoro Villas', '142 Main St, Ngorongoro', 4, '$400-$716',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1555854877-bab0e564b8d5?w=800',
  'Nature', 4.69, 463, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-wifi-line|Free WiFi','ri-beach-line|Private Beach','ri-goblet-line|Rooftop Bar','ri-mountain-line|Mountain Views','ri-24-hours-line|24h Reception','ri-fitness-line|Gym')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Los Angeles'),
  'Pearl Los Angeles Manor', '130 Grand Ave, Los Angeles', 5, '$350-$734',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?w=800',
  'Cultural', 4.77, 369, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-24-hours-line|24h Reception','ri-beach-line|Private Beach','ri-mountain-line|Mountain Views','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Bangkok'),
  'Aurora Bangkok Grand Hotel', '34 Grand Ave, Bangkok', 4, '$110-$211',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Nature', 4.44, 108, 'Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-restaurant-line|Breakfast Included','ri-beach-line|Private Beach','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Riyadh'),
  'Tranquil Riyadh Suites', '87 Park Rd, Riyadh', 3, '$350-$580',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1546961342-ea5f62d5a27b?w=800',
  'Nature', 4.4, 362, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-ship-line|Water Transport','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Marrakech'),
  'Premier Marrakech Beach Resort', '155 Harbour Dr, Marrakech', 3, '$500-$767',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800',
  'Iconic Cities', 4.97, 606, 'Guest Favourite',
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-garden-line|Garden','ri-spa-line|Spa','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Barcelona'),
  'Horizon Barcelona Palace', '53 Ocean Blvd, Barcelona', 4, '$500-$852',
  0.0000, 0.0000,
  'Wellness retreat in ancient surroundings',
  'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800',
  'Wellness', 4.59, 624, 'Best Value',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-service-line|Concierge','ri-spa-line|Spa','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Riyadh'),
  'Azure Riyadh Hotel', '63 Old Town Square, Riyadh', 5, '$180-$306',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800',
  'Cultural', 4.49, 216, NULL,
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-service-line|Concierge','ri-garden-line|Garden','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Buenos Aires'),
  'Palace Buenos Aires Boutique Hotel', '106 Park Rd, Buenos Aires', 5, '$300-$616',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800',
  'Nature', 4.32, 271, 'Guest Favourite',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-map-pin-line|City Centre','ri-beach-line|Private Beach','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tetiaroa'),
  'Signature Tetiaroa Resort', '170 Harbour Dr, Tetiaroa', 4, '$350-$539',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800',
  'Nature', 4.52, 410, 'Iconic',
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-wifi-line|Free WiFi','ri-car-line|Valet Parking','ri-garden-line|Garden','ri-service-line|Concierge')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Masai Mara'),
  'Haven Masai Mara House', '115 Harbour Dr, Masai Mara', 4, '$300-$581',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
  'Nature', 4.75, 376, NULL,
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-restaurant-2-line|Fine Dining','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Venice'),
  'Signature Venice Retreat', '134 Royal Way, Venice', 4, '$130-$203',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
  'Wellness', 4.47, 150, 'Luxury',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-leaf-line|Eco-Friendly','ri-goblet-line|Rooftop Bar','ri-building-line|Historic Building','ri-garden-line|Garden','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rome'),
  'Essence Rome Resort', '96 Ocean Blvd, Rome', 5, '$90-$138',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1485738422979-f5c462d49f74?w=800',
  'Cultural', 4.65, 81, NULL,
  'A storied address beloved by celebrities and heads of state for its discreet elegance.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-goblet-line|Rooftop Bar','ri-fitness-line|Gym','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Canyon Point'),
  'Haven Canyon Point House', '134 Harbour Dr, Canyon Point', 4, '$90-$155',
  0.0000, 0.0000,
  'Harbour-facing rooms in the marina district',
  'https://images.unsplash.com/photo-1549294413-26f195200786?w=800',
  'Cultural', 4.56, 86, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-tennis-ball-line|Tennis Court','ri-swimming-pool-line|Pool','ri-building-line|Historic Building','ri-service-line|Concierge','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='London'),
  'Villa London Luxury Hotel', '20 Ocean Blvd, London', 5, '$350-$661',
  0.0000, 0.0000,
  'Rooftop pool with panoramic city views',
  'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
  'Wellness', 4.59, 374, NULL,
  'Sweeping vistas, impeccable rooms and a spa that brings ancient healing traditions to life.',
  JSON_ARRAY('ri-building-line|Historic Building','ri-beach-line|Private Beach','ri-service-line|Concierge','ri-garden-line|Garden','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Masai Mara'),
  'Haven Masai Mara Luxury Hotel', '34 Harbour Dr, Masai Mara', 3, '$500-$824',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800',
  'Coastal', 4.95, 523, 'Guest Favourite',
  'From sunrise yoga to candlelit dinners, every moment is crafted to create lasting memories.',
  JSON_ARRAY('ri-spa-line|Spa','ri-tennis-ball-line|Tennis Court','ri-restaurant-line|Breakfast Included','ri-goblet-line|Rooftop Bar','ri-swimming-pool-line|Pool','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tulum'),
  'Palace Tulum Palace', '96 Ocean Blvd, Tulum', 5, '$150-$255',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  'Coastal', 4.82, 160, 'Iconic',
  'Effortlessly stylish with a loyal following among travellers who value substance over flash.',
  JSON_ARRAY('ri-mountain-line|Mountain Views','ri-beach-line|Private Beach','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi','ri-spa-line|Spa')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='London'),
  'Elite London Pavilion', '18 Old Town Square, London', 3, '$200-$367',
  0.0000, 0.0000,
  'Design-forward boutique in the cultural quarter',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Nature', 4.91, 242, NULL,
  'The region''s most coveted address, where architecture and landscape merge in perfect harmony.',
  JSON_ARRAY('ri-service-line|Concierge','ri-garden-line|Garden','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Zighy Bay'),
  'Aurora Zighy Bay Luxury Hotel', '39 Old Town Square, Zighy Bay', 5, '$90-$185',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800',
  'Nature', 4.38, 95, 'Luxury',
  'A favourite for its genuine warmth, exceptional food programme and intuitive, unhurried service.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-restaurant-2-line|Fine Dining','ri-beach-line|Private Beach','ri-wifi-line|Free WiFi','ri-goblet-line|Rooftop Bar','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Dubai'),
  'Horizon Dubai Palace', '165 Royal Way, Dubai', 3, '$130-$281',
  0.0000, 0.0000,
  'Rice terrace villa with jungle backdrop',
  'https://images.unsplash.com/photo-1551038247-3d9af20df552?w=800',
  'Iconic Cities', 4.96, 144, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-spa-line|Spa','ri-ship-line|Water Transport','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Miami'),
  'Grand Miami Collection', '53 Grand Ave, Miami', 5, '$90-$185',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Nature', 4.67, 98, 'Luxury',
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-building-line|Historic Building','ri-wifi-line|Free WiFi','ri-garden-line|Garden','ri-shield-check-line|24h Security','ri-mountain-line|Mountain Views')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lucerne'),
  'Boutique Lucerne Suites', '30 Main St, Lucerne', 4, '$150-$240',
  0.0000, 0.0000,
  'Colonial-era mansion with modern comforts',
  'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  'Iconic Cities', 4.32, 192, 'Best Value',
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-beach-line|Private Beach','ri-wifi-line|Free WiFi','ri-swimming-pool-line|Pool','ri-goblet-line|Rooftop Bar','ri-map-pin-line|City Centre')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tetiaroa'),
  'Hotel Tetiaroa Villas', '37 Park Rd, Tetiaroa', 5, '$150-$264',
  0.0000, 0.0000,
  'Clifftop views over crystal waters',
  'https://images.unsplash.com/photo-1445991842772-097fea258e7b?w=800',
  'Coastal', 4.39, 170, 'Eco-Luxury',
  'A sustainable sanctuary committed to conservation while delivering uncompromising comfort.',
  JSON_ARRAY('ri-spa-line|Spa','ri-car-line|Valet Parking','ri-swimming-pool-line|Pool','ri-shield-check-line|24h Security','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Hanoi'),
  'Azure Hanoi Suites', '124 Main St, Hanoi', 5, '$400-$665',
  0.0000, 0.0000,
  'Iconic luxury in the heart of the city',
  'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  'Wellness', 4.96, 468, 'Eco-Luxury',
  'Boutique in scale but grand in ambition — a quietly confident jewel in a landmark location.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-fitness-line|Gym','ri-building-line|Historic Building','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tokyo'),
  'The Tokyo Beach Resort', '53 Old Town Square, Tokyo', 4, '$180-$338',
  0.0000, 0.0000,
  'Sleek urban retreat in the financial district',
  'https://images.unsplash.com/photo-1527853787696-f7be74f2e39a?w=800',
  'Wellness', 4.95, 231, NULL,
  'A landmark property combining world-class service with breathtaking views and locally inspired design.',
  JSON_ARRAY('ri-community-line|Co-working Space','ri-goblet-line|Rooftop Bar','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rome'),
  'Grand Rome Resort', '124 Ocean Blvd, Rome', 4, '$400-$706',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Coastal', 4.66, 441, 'Luxury',
  'Set amid stunning scenery, this resort offers an unparalleled blend of luxury and natural beauty.',
  JSON_ARRAY('ri-goblet-line|Rooftop Bar','ri-restaurant-2-line|Fine Dining','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Rio de Janeiro'),
  'Haven Rio de Janeiro Palace', '36 Harbour Dr, Rio de Janeiro', 4, '$200-$329',
  0.0000, 0.0000,
  'Safari camp under the stars',
  'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
  'Cultural', 4.7, 258, NULL,
  'Thoughtfully designed spaces that connect guests with the local culture, cuisine and landscape.',
  JSON_ARRAY('ri-shield-check-line|24h Security','ri-tennis-ball-line|Tennis Court','ri-mountain-line|Mountain Views','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Tokyo'),
  'Summit Tokyo Villas', '5 Harbour Dr, Tokyo', 4, '$400-$858',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
  'Iconic Cities', 4.91, 467, NULL,
  'Bold architecture meets warm hospitality in this award-winning property at the city''s cultural heart.',
  JSON_ARRAY('ri-map-pin-line|City Centre','ri-ship-line|Water Transport','ri-restaurant-2-line|Fine Dining','ri-fitness-line|Gym','ri-wifi-line|Free WiFi','ri-community-line|Co-working Space')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Mumbai'),
  'Luxe Mumbai Luxury Hotel', '173 Main St, Mumbai', 5, '$200-$415',
  0.0000, 0.0000,
  'Garden sanctuary in the old town',
  'https://images.unsplash.com/photo-1562602833-0f4ab2fc46e5?w=800',
  'Coastal', 4.86, 244, 'Luxury',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-restaurant-line|Breakfast Included','ri-mountain-line|Mountain Views','ri-community-line|Co-working Space','ri-wifi-line|Free WiFi','ri-leaf-line|Eco-Friendly','ri-tennis-ball-line|Tennis Court')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Lucerne'),
  'Grand Lucerne Collection', '175 Harbour Dr, Lucerne', 5, '$130-$203',
  0.0000, 0.0000,
  'Art deco landmark on the main boulevard',
  'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=800',
  'Cultural', 4.84, 128, NULL,
  'The ultimate indulgence — private pools, butler service and cuisine that defines the destination.',
  JSON_ARRAY('ri-car-line|Valet Parking','ri-24-hours-line|24h Reception','ri-wifi-line|Free WiFi')
);

INSERT INTO hotels (destination_id, name, address, star_rating, price_range, latitude, longitude, title, image, category, rating, price, badge, description, features)
VALUES (
  (SELECT id FROM destinations WHERE city='Chiang Rai'),
  'Grand Chiang Rai Inn', '164 Park Rd, Chiang Rai', 3, '$150-$284',
  0.0000, 0.0000,
  'Floating overwater bungalows',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
  'Wellness', 4.35, 179, 'Best Value',
  'An intimate retreat where every detail is curated for discerning travellers seeking authentic experiences.',
  JSON_ARRAY('ri-restaurant-2-line|Fine Dining','ri-service-line|Concierge','ri-car-line|Valet Parking','ri-wifi-line|Free WiFi')
);


-- ── End of seed data ──────────────────────────────────────
-- Total: 500 hotels across 235 destinations in 100+ countries
