-- ==========================================
-- 1. DATABASE INITIALIZATION
-- ==========================================
DROP DATABASE IF EXISTS travel_system;
CREATE DATABASE travel_system;
USE travel_system;

-- ==========================================
-- 2. TABLE CREATION
-- ==========================================

-- A. Users Table
CREATE TABLE users (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    username    VARCHAR(100) NOT NULL UNIQUE,
    email       VARCHAR(255) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- B. Feedback Table
CREATE TABLE feedback (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT,
    subject    VARCHAR(255) NOT NULL,
    message    TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- C. Trip Reviews Table
CREATE TABLE trip_reviews (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    destination VARCHAR(255) NOT NULL,
    rating      INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- D. Worldwide Destinations Table
--    One row per country. Category scores 0-10 reflect expert travel consensus.
--    category_primary = dominant travel category (for quick filter queries).
CREATE TABLE destinations (
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    country_name          VARCHAR(150) NOT NULL UNIQUE,
    country_code          CHAR(3)      NOT NULL,
    region                VARCHAR(100) NOT NULL,
    sub_region            VARCHAR(100),
    capital               VARCHAR(100),
    currency              VARCHAR(80),
    language              VARCHAR(150),
    best_months           VARCHAR(100),
    avg_daily_budget_usd  SMALLINT,
    visa_ease             ENUM('Easy','Moderate','Difficult') DEFAULT 'Moderate',

    -- Category scores out of 10
    score_cultural   TINYINT UNSIGNED DEFAULT 5,
    score_adventure  TINYINT UNSIGNED DEFAULT 5,
    score_food       TINYINT UNSIGNED DEFAULT 5,
    score_beach      TINYINT UNSIGNED DEFAULT 5,
    score_shopping   TINYINT UNSIGNED DEFAULT 5,
    score_family     TINYINT UNSIGNED DEFAULT 5,

    -- Dominant category
    category_primary ENUM(
        'Cultural & History',
        'Adventure & Nature',
        'Food & Cuisine',
        'Relaxation & Beach',
        'Shopping & City Life',
        'Family Friendly'
    ) NOT NULL,

    highlights  TEXT,
    flag_emoji  VARCHAR(10),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- 3. SEED: USERS & SAMPLE DATA
-- ==========================================
INSERT INTO users (first_name, last_name, username, email, password) VALUES
('System','Admin','admin','admin@travelsystem.com','$2b$10$SampleHashedPassword123'),
('John','Doe','johndoe','john@example.com','$2b$10$AnotherSampleHashedPassword');

INSERT INTO feedback (user_id, subject, message) VALUES
(2,'Website Bug','The destination page loads a bit slow on mobile devices.');

INSERT INTO trip_reviews (user_id, destination, rating, review_text) VALUES
(2,'Paris, France',5,'An incredible experience! The Eiffel Tower tour was seamless.'),
(2,'Tokyo, Japan', 4,'Amazing food and culture, though navigating the subway was tricky at first.');

-- ==========================================
-- 4. WORLDWIDE DESTINATIONS
--    Covers all UN-recognised countries + key territories.
--    Columns: country_name, country_code, region, sub_region, capital,
--             currency, language, best_months, avg_daily_budget_usd, visa_ease,
--             score_cultural, score_adventure, score_food, score_beach,
--             score_shopping, score_family, category_primary, highlights, flag_emoji
-- ==========================================

INSERT INTO destinations
(country_name,country_code,region,sub_region,capital,currency,language,best_months,avg_daily_budget_usd,visa_ease,score_cultural,score_adventure,score_food,score_beach,score_shopping,score_family,category_primary,highlights,flag_emoji)
VALUES

-- ── EUROPE ──────────────────────────────────────────────────────────────────
('France','FRA','Europe','Western Europe','Paris','Euro (€)','French','Apr–Jun, Sep–Oct',150,'Easy',10,6,10,7,9,8,'Cultural & History','Eiffel Tower, Loire Valley châteaux, Louvre, Bordeaux vineyards, Riviera','🇫🇷'),
('Italy','ITA','Europe','Southern Europe','Rome','Euro (€)','Italian','Apr–Jun, Sep–Oct',130,'Easy',10,6,10,8,8,9,'Cultural & History','Colosseum, Venice canals, Amalfi Coast, Florence art, Sicilian cuisine','🇮🇹'),
('Spain','ESP','Europe','Southern Europe','Madrid','Euro (€)','Spanish','Apr–Jun, Sep–Oct',100,'Easy',9,7,9,9,8,9,'Cultural & History','Sagrada Família, Alhambra, Ibiza beaches, San Sebastián food scene, Flamenco','🇪🇸'),
('Greece','GRC','Europe','Southern Europe','Athens','Euro (€)','Greek','May–Oct',90,'Easy',9,6,8,10,6,8,'Relaxation & Beach','Santorini sunsets, Acropolis, Mykonos beaches, Cretan cuisine, Delphi','🇬🇷'),
('Portugal','PRT','Europe','Southern Europe','Lisbon','Euro (€)','Portuguese','Apr–Jun, Sep–Oct',80,'Easy',8,6,8,9,6,8,'Cultural & History','Lisbon trams, Algarve sea cliffs, Porto wine caves, Sintra palaces','🇵🇹'),
('Germany','DEU','Europe','Western Europe','Berlin','Euro (€)','German','May–Sep',120,'Easy',9,5,7,2,9,8,'Cultural & History','Berlin history, Neuschwanstein, Oktoberfest, Black Forest, Rhine Valley','🇩🇪'),
('Netherlands','NLD','Europe','Western Europe','Amsterdam','Euro (€)','Dutch','Apr–Sep',130,'Easy',8,5,7,3,8,8,'Cultural & History','Anne Frank House, tulip fields, Rijksmuseum, canal tours, Delft','🇳🇱'),
('Switzerland','CHE','Europe','Western Europe','Bern','Swiss Franc (CHF)','German/French/Italian','Jun–Sep, Dec–Feb',250,'Easy',7,10,7,2,7,9,'Adventure & Nature','Swiss Alps skiing, Matterhorn, Lake Geneva, Interlaken adventure sports','🇨🇭'),
('Austria','AUT','Europe','Western Europe','Vienna','Euro (€)','German','Apr–Oct',130,'Easy',9,8,7,2,7,8,'Cultural & History','Vienna opera, Schönbrunn Palace, Salzburg music, Alpine hiking','🇦🇹'),
('United Kingdom','GBR','Europe','Northern Europe','London','Pound Sterling (£)','English','May–Sep',180,'Easy',9,5,8,3,10,9,'Shopping & City Life','London museums, Scottish Highlands, Big Ben, Edinburgh Castle, Stonehenge','🇬🇧'),
('Ireland','IRL','Europe','Northern Europe','Dublin','Euro (€)','English/Irish','Jun–Aug',140,'Easy',8,7,6,4,6,8,'Cultural & History','Cliffs of Moher, Dublin pubs, Ring of Kerry, Galway, Giant Causeway','🇮🇪'),
('Sweden','SWE','Europe','Northern Europe','Stockholm','Swedish Krona (SEK)','Swedish','Jun–Aug',160,'Easy',7,8,6,4,7,8,'Adventure & Nature','Northern Lights, Stockholm archipelago, Abisko trekking, ABBA Museum','🇸🇪'),
('Norway','NOR','Europe','Northern Europe','Oslo','Norwegian Krone (NOK)','Norwegian','Jun–Aug',200,'Easy',7,10,5,3,6,8,'Adventure & Nature','Fjords, Northern Lights, Trolltunga, Viking Ship Museum, Bergen','🇳🇴'),
('Denmark','DNK','Europe','Northern Europe','Copenhagen','Danish Krone (DKK)','Danish','May–Aug',160,'Easy',7,5,7,3,8,9,'Cultural & History','Tivoli Gardens, Nyhavn harbour, Legoland, NOMA cuisine','🇩🇰'),
('Finland','FIN','Europe','Northern Europe','Helsinki','Euro (€)','Finnish/Swedish','Jun–Aug, Dec–Jan',150,'Easy',6,9,5,3,6,8,'Adventure & Nature','Northern Lights, Rovaniemi, sauna culture, Lakeland region, reindeer','🇫🇮'),
('Iceland','ISL','Europe','Northern Europe','Reykjavik','Icelandic Króna (ISK)','Icelandic','Jun–Aug',200,'Easy',6,10,5,2,5,7,'Adventure & Nature','Northern Lights, Golden Circle, geysers, glacier hikes, Blue Lagoon','🇮🇸'),
('Poland','POL','Europe','Eastern Europe','Warsaw','Polish Złoty (PLN)','Polish','May–Sep',60,'Easy',8,5,7,2,6,7,'Cultural & History','Kraków Old Town, Auschwitz memorial, Warsaw uprising, Tatra Mountains','🇵🇱'),
('Czech Republic','CZE','Europe','Eastern Europe','Prague','Czech Koruna (CZK)','Czech','May–Sep',70,'Easy',9,5,7,2,7,8,'Cultural & History','Prague Castle, Charles Bridge, beer culture, Český Krumlov','🇨🇿'),
('Hungary','HUN','Europe','Eastern Europe','Budapest','Hungarian Forint (HUF)','Hungarian','Apr–Oct',60,'Easy',8,5,7,3,6,7,'Cultural & History','Budapest baths, Parliament, Danube cruise, Tokaj wine','🇭🇺'),
('Romania','ROU','Europe','Eastern Europe','Bucharest','Romanian Leu (RON)','Romanian','May–Sep',40,'Easy',8,8,6,3,5,7,'Cultural & History','Dracula Castle, Transylvania, Danube Delta, Painted Monasteries','🇷🇴'),
('Croatia','HRV','Europe','Southern Europe','Zagreb','Euro (€)','Croatian','Jun–Sep',90,'Easy',8,7,7,10,6,8,'Relaxation & Beach','Dubrovnik walls, Plitvice Lakes, Hvar island, Adriatic coast','🇭🇷'),
('Bulgaria','BGR','Europe','Eastern Europe','Sofia','Bulgarian Lev (BGN)','Bulgarian','Jun–Sep',40,'Easy',7,6,6,7,5,7,'Relaxation & Beach','Black Sea resorts, Rila Monastery, Plovdiv old town, Rhodope Mountains','🇧🇬'),
('Serbia','SRB','Europe','Southern Europe','Belgrade','Serbian Dinar (RSD)','Serbian','Apr–Oct',35,'Easy',7,5,7,2,5,6,'Cultural & History','Belgrade fortress, Novi Sad, Đerdap national park, Exit festival','🇷🇸'),
('Slovenia','SVN','Europe','Southern Europe','Ljubljana','Euro (€)','Slovenian','Jun–Sep',90,'Easy',7,9,6,4,5,8,'Adventure & Nature','Lake Bled, Triglav National Park, Postojna Cave, Julian Alps','🇸🇮'),
('Slovakia','SVK','Europe','Eastern Europe','Bratislava','Euro (€)','Slovak','May–Sep',60,'Easy',7,7,6,2,5,7,'Cultural & History','Bratislava castle, High Tatras, Slovak karst caves, Banská Štiavnica','🇸🇰'),
('Belgium','BEL','Europe','Western Europe','Brussels','Euro (€)','Dutch/French/German','Apr–Sep',130,'Easy',8,4,9,2,8,8,'Food & Cuisine','Belgian chocolate & waffles, Bruges canals, Ghent medieval, beer culture','🇧🇪'),
('Luxembourg','LUX','Europe','Western Europe','Luxembourg City','Euro (€)','Luxembourgish','May–Sep',150,'Easy',7,4,6,2,7,7,'Cultural & History','Luxembourg City fortifications, Vianden Castle, Ardennes forest','🇱🇺'),
('Monaco','MCO','Europe','Western Europe','Monaco','Euro (€)','French','May–Oct',500,'Easy',6,3,8,7,10,6,'Shopping & City Life','Formula 1 circuit, Monte-Carlo Casino, luxury yachts, fine dining','🇲🇨'),
('Malta','MLT','Europe','Southern Europe','Valletta','Euro (€)','Maltese/English','May–Oct',80,'Easy',8,5,7,9,6,8,'Relaxation & Beach','Valletta heritage, Blue Lagoon, ancient temples, Mdina, diving','🇲🇹'),
('Cyprus','CYP','Europe','Southern Europe','Nicosia','Euro (€)','Greek/Turkish','Apr–Oct',80,'Easy',7,5,7,10,6,8,'Relaxation & Beach','Nissi Beach, Troodos Mountains, Aphrodite Hills, Paphos archaeological park','🇨🇾'),
('Albania','ALB','Europe','Southern Europe','Tirana','Albanian Lek (ALL)','Albanian','Jun–Sep',35,'Easy',7,8,6,8,4,6,'Adventure & Nature','Albanian Riviera, Accursed Mountains, Butrint ruins, Berat old city','🇦🇱'),
('North Macedonia','MKD','Europe','Southern Europe','Skopje','Macedonian Denar (MKD)','Macedonian','May–Sep',30,'Easy',7,7,6,3,4,6,'Cultural & History','Lake Ohrid UNESCO site, Skopje bazaar, Mavrovo National Park','🇲🇰'),
('Bosnia and Herzegovina','BIH','Europe','Southern Europe','Sarajevo','Convertible Mark (BAM)','Bosnian','May–Sep',35,'Easy',8,7,7,2,4,6,'Cultural & History','Sarajevo Old Bazaar, Mostar bridge, Una National Park','🇧🇦'),
('Montenegro','MNE','Europe','Southern Europe','Podgorica','Euro (€)','Montenegrin','Jun–Sep',60,'Easy',7,8,6,9,4,7,'Relaxation & Beach','Bay of Kotor, Sveti Stefan island, Durmitor National Park','🇲🇪'),
('Ukraine','UKR','Europe','Eastern Europe','Kyiv','Ukrainian Hryvnia (UAH)','Ukrainian','May–Oct',30,'Moderate',8,6,7,3,5,6,'Cultural & History','Kyiv Pechersk Lavra, Lviv old town, Carpathian Mountains','🇺🇦'),
('Belarus','BLR','Europe','Eastern Europe','Minsk','Belarusian Ruble (BYN)','Belarusian/Russian','Jun–Sep',40,'Difficult',6,5,5,2,4,5,'Cultural & History','Mir Castle, Bialowieza Forest, Brest Fortress, Nesvizh Palace','🇧🇾'),
('Moldova','MDA','Europe','Eastern Europe','Chisinau','Moldovan Leu (MDL)','Romanian','May–Sep',25,'Easy',6,4,6,2,3,5,'Food & Cuisine','Cricova winery, Orheiul Vechi monastery, wine tourism routes','🇲🇩'),
('Estonia','EST','Europe','Northern Europe','Tallinn','Euro (€)','Estonian','Jun–Aug',90,'Easy',7,6,6,3,6,7,'Cultural & History','Tallinn Old Town, Lahemaa National Park, Tartu university city','🇪🇪'),
('Latvia','LVA','Europe','Northern Europe','Riga','Euro (€)','Latvian','Jun–Aug',80,'Easy',7,6,5,3,5,6,'Cultural & History','Riga Art Nouveau, Gauja National Park, Rundale Palace','🇱🇻'),
('Lithuania','LTU','Europe','Northern Europe','Vilnius','Euro (€)','Lithuanian','Jun–Aug',75,'Easy',7,6,5,3,5,6,'Cultural & History','Vilnius Old Town, Curonian Spit, Hill of Crosses, Trakai Castle','🇱🇹'),
('Russia','RUS','Europe','Eastern Europe','Moscow','Russian Ruble (₽)','Russian','Jun–Sep, Dec–Feb',60,'Difficult',9,8,7,2,7,6,'Cultural & History','Red Square, Trans-Siberian Railway, Lake Baikal, St Petersburg, Hermitage','🇷🇺'),
('Kosovo','XKX','Europe','Southern Europe','Pristina','Euro (€)','Albanian/Serbian','May–Sep',30,'Moderate',6,6,6,2,4,5,'Cultural & History','Pristina street art, Rugova Canyon, Visoki Decani Monastery','🏳️'),
('Andorra','AND','Europe','Southern Europe','Andorra la Vella','Euro (€)','Catalan','Dec–Mar, Jun–Sep',100,'Easy',6,8,6,2,9,7,'Shopping & City Life','Ski resorts, duty-free shopping, Romanesque churches, hiking','🇦🇩'),
('San Marino','SMR','Europe','Southern Europe','City of San Marino','Euro (€)','Italian','Apr–Oct',100,'Easy',7,4,6,2,6,7,'Cultural & History','Three Towers fortress, medieval old town, stunning panoramas','🇸🇲'),
('Liechtenstein','LIE','Europe','Western Europe','Vaduz','Swiss Franc (CHF)','German','Jun–Sep, Dec–Feb',200,'Easy',6,7,6,2,7,7,'Adventure & Nature','Vaduz Castle, Rhine Valley, hiking, alpine skiing','🇱🇮'),

-- ── ASIA ─────────────────────────────────────────────────────────────────────
('Japan','JPN','Asia','Eastern Asia','Tokyo','Japanese Yen (¥)','Japanese','Mar–May, Sep–Nov',150,'Easy',10,7,10,5,9,9,'Cultural & History','Mt Fuji, Kyoto temples, Tokyo neon, cherry blossoms, sushi culture','🇯🇵'),
('China','CHN','Asia','Eastern Asia','Beijing','Chinese Yuan (¥)','Mandarin','Apr–Jun, Sep–Oct',70,'Difficult',10,8,9,4,9,8,'Cultural & History','Great Wall, Forbidden City, Li River, Shanghai skyline, dim sum','🇨🇳'),
('South Korea','KOR','Asia','Eastern Asia','Seoul','South Korean Won (₩)','Korean','Apr–Jun, Sep–Nov',80,'Easy',8,6,9,4,10,8,'Shopping & City Life','Gyeongbokgung Palace, K-culture, Jeju Island, Korean BBQ, Myeongdong','🇰🇷'),
('India','IND','Asia','Southern Asia','New Delhi','Indian Rupee (₹)','Hindi/English','Oct–Mar',30,'Easy',10,8,10,7,7,8,'Cultural & History','Taj Mahal, Rajasthan palaces, Kerala backwaters, Goa beaches, spice cuisine','🇮🇳'),
('Thailand','THA','Asia','South-eastern Asia','Bangkok','Thai Baht (฿)','Thai','Nov–Mar',50,'Easy',8,8,9,10,8,8,'Relaxation & Beach','Phi Phi Islands, Bangkok temples, Chiang Mai jungle, Floating Markets','🇹🇭'),
('Vietnam','VNM','Asia','South-eastern Asia','Hanoi','Vietnamese Dong (₫)','Vietnamese','Feb–Apr, Aug–Oct',35,'Easy',8,8,9,8,7,8,'Food & Cuisine','Ha Long Bay, Hoi An lanterns, pho & banh mi, Sapa rice terraces','🇻🇳'),
('Indonesia','IDN','Asia','South-eastern Asia','Jakarta','Indonesian Rupiah (Rp)','Indonesian','May–Sep',40,'Easy',8,9,8,10,6,8,'Relaxation & Beach','Bali temples & beaches, Komodo dragons, Yogyakarta, Raja Ampat diving','🇮🇩'),
('Malaysia','MYS','Asia','South-eastern Asia','Kuala Lumpur','Malaysian Ringgit (RM)','Malay/English','Mar–Oct',50,'Easy',7,8,9,8,9,8,'Food & Cuisine','Petronas Towers, Borneo rainforest, Penang street food, Langkawi beaches','🇲🇾'),
('Singapore','SGP','Asia','South-eastern Asia','Singapore','Singapore Dollar (S$)','English/Malay/Chinese','Feb–Apr',200,'Easy',7,5,9,5,10,9,'Shopping & City Life','Gardens by the Bay, Marina Bay Sands, Hawker centres, Universal Studios','🇸🇬'),
('Philippines','PHL','Asia','South-eastern Asia','Manila','Philippine Peso (₱)','Filipino/English','Dec–May',40,'Easy',7,8,8,10,6,8,'Relaxation & Beach','Palawan paradise, Chocolate Hills, whale sharks, Intramuros','🇵🇭'),
('Cambodia','KHM','Asia','South-eastern Asia','Phnom Penh','Cambodian Riel (KHR)','Khmer','Nov–Mar',30,'Easy',9,6,7,5,4,7,'Cultural & History','Angkor Wat, Bayon temple, Siem Reap, Mekong River, Royal Palace','🇰🇭'),
('Myanmar','MMR','Asia','South-eastern Asia','Naypyidaw','Burmese Kyat (MMK)','Burmese','Nov–Feb',35,'Difficult',8,7,7,5,4,6,'Cultural & History','Bagan temples, Inle Lake, Mandalay, Shwedagon Pagoda, Inwa','🇲🇲'),
('Laos','LAO','Asia','South-eastern Asia','Vientiane','Lao Kip (₭)','Lao','Nov–Apr',25,'Easy',7,8,7,4,3,6,'Adventure & Nature','Luang Prabang, Mekong slow boat, Kuang Si Falls, 4000 Islands','🇱🇦'),
('Nepal','NPL','Asia','Southern Asia','Kathmandu','Nepalese Rupee (NPR)','Nepali','Mar–May, Sep–Nov',35,'Easy',8,10,6,2,3,7,'Adventure & Nature','Everest Base Camp, Annapurna Circuit, Kathmandu Durbar Square','🇳🇵'),
('Sri Lanka','LKA','Asia','Southern Asia','Sri Jayawardenepura Kotte','Sri Lankan Rupee (LKR)','Sinhala/Tamil','Dec–Mar',40,'Easy',8,8,8,9,5,8,'Relaxation & Beach','Sigiriya Rock, Yala safari, Galle fort, tea country, tropical beaches','🇱🇰'),
('Maldives','MDV','Asia','Southern Asia','Male','Maldivian Rufiyaa (MVR)','Dhivehi','Nov–Apr',300,'Easy',3,7,6,10,4,8,'Relaxation & Beach','Overwater bungalows, coral reefs, crystal lagoons, world-class diving','🇲🇻'),
('Bhutan','BTN','Asia','Southern Asia','Thimphu','Bhutanese Ngultrum','Dzongkha','Mar–May, Sep–Nov',250,'Difficult',9,8,6,2,3,6,'Cultural & History','Tigers Nest monastery, Gross National Happiness, pristine Himalayas','🇧🇹'),
('Pakistan','PAK','Asia','Southern Asia','Islamabad','Pakistani Rupee (PKR)','Urdu/English','Apr–Jun, Sep–Oct',25,'Moderate',8,9,8,3,5,5,'Adventure & Nature','K2 base camp, Lahore Mughal heritage, Karakoram Highway, Mohenjo-daro','🇵🇰'),
('Bangladesh','BGD','Asia','Southern Asia','Dhaka','Bangladeshi Taka (BDT)','Bengali','Nov–Mar',20,'Moderate',7,5,7,5,4,5,'Cultural & History','Sundarbans mangroves, Mosque City Bagerhat, Cox Bazar beach','🇧🇩'),
('Iran','IRN','Asia','Southern Asia','Tehran','Iranian Rial (IRR)','Persian','Apr–Jun, Sep–Oct',30,'Difficult',9,7,8,3,5,6,'Cultural & History','Persepolis, Isfahan Grand Mosque, Yazd old city, Persian cuisine','🇮🇷'),
('Saudi Arabia','SAU','Asia','Western Asia','Riyadh','Saudi Riyal (SAR)','Arabic','Oct–Apr',100,'Moderate',8,6,7,5,9,7,'Shopping & City Life','AlUla ancient city, Riyadh skyline, Jeddah corniche, Red Sea diving','🇸🇦'),
('United Arab Emirates','ARE','Asia','Western Asia','Abu Dhabi','UAE Dirham (AED)','Arabic/English','Oct–Apr',200,'Easy',7,7,8,7,10,9,'Shopping & City Life','Burj Khalifa, Dubai Mall, Louvre Abu Dhabi, desert safaris, luxury hotels','🇦🇪'),
('Qatar','QAT','Asia','Western Asia','Doha','Qatari Riyal (QAR)','Arabic/English','Oct–Apr',150,'Easy',7,5,8,5,9,7,'Shopping & City Life','Museum of Islamic Art, Souq Waqif, Pearl Island, stadium tours','🇶🇦'),
('Kuwait','KWT','Asia','Western Asia','Kuwait City','Kuwaiti Dinar (KWD)','Arabic/English','Oct–Mar',120,'Moderate',6,4,7,4,8,6,'Shopping & City Life','Kuwait Towers, Grand Mosque, The Avenues Mall, Failaka Island','🇰🇼'),
('Bahrain','BHR','Asia','Western Asia','Manama','Bahraini Dinar (BHD)','Arabic/English','Oct–Apr',100,'Easy',7,5,7,6,8,7,'Cultural & History','Bahrain Fort, Formula 1 circuit, Tree of Life, Al-Qaisariah souq','🇧🇭'),
('Oman','OMN','Asia','Western Asia','Muscat','Omani Rial (OMR)','Arabic/English','Oct–Apr',80,'Easy',8,9,7,7,6,8,'Adventure & Nature','Wahiba Sands, Wadi Shab, Muscat corniche, Jebel Akhdar, turtle beaches','🇴🇲'),
('Jordan','JOR','Asia','Western Asia','Amman','Jordanian Dinar (JOD)','Arabic/English','Mar–May, Sep–Nov',70,'Easy',9,8,7,5,6,8,'Cultural & History','Petra rose-city, Wadi Rum desert, Dead Sea float, Jerash ruins','🇯🇴'),
('Israel','ISR','Asia','Western Asia','Jerusalem','Israeli New Shekel (ILS)','Hebrew/Arabic','Mar–May, Sep–Nov',150,'Moderate',10,6,8,6,7,8,'Cultural & History','Jerusalem holy sites, Tel Aviv beaches, Masada, Dead Sea, hummus trail','🇮🇱'),
('Lebanon','LBN','Asia','Western Asia','Beirut','Lebanese Pound (LBP)','Arabic/French','Apr–Jun, Sep–Nov',50,'Easy',8,6,9,5,6,6,'Food & Cuisine','Beirut nightlife, Baalbek ruins, Jeita Grotto, Lebanese mezze','🇱🇧'),
('Turkey','TUR','Asia','Western Asia','Ankara','Turkish Lira (₺)','Turkish','Apr–Jun, Sep–Oct',60,'Easy',9,7,9,8,8,8,'Cultural & History','Cappadocia balloons, Hagia Sophia, Ephesus, Antalya beaches, Turkish kebab','🇹🇷'),
('Georgia','GEO','Asia','Western Asia','Tbilisi','Georgian Lari (GEL)','Georgian','May–Jun, Sep–Oct',40,'Easy',8,8,8,3,5,7,'Cultural & History','Tbilisi old town, Kazbegi mountains, Georgian wine, cave cities','🇬🇪'),
('Armenia','ARM','Asia','Western Asia','Yerevan','Armenian Dram (AMD)','Armenian','May–Oct',40,'Easy',8,7,7,2,4,6,'Cultural & History','Geghard monastery, Lake Sevan, Khor Virap, Yerevan brandy culture','🇦🇲'),
('Azerbaijan','AZE','Asia','Western Asia','Baku','Azerbaijani Manat (AZN)','Azerbaijani','Apr–Jun, Sep–Oct',50,'Easy',7,7,7,4,6,6,'Cultural & History','Baku flame towers, Gobustan rock art, Sheki Palace, mud volcanoes','🇦🇿'),
('Kazakhstan','KAZ','Asia','Central Asia','Nur-Sultan','Kazakhstani Tenge (KZT)','Kazakh/Russian','May–Sep',50,'Easy',6,8,6,3,5,6,'Adventure & Nature','Charyn Canyon, Altai Mountains, Baikonur Cosmodrome, steppe nomad culture','🇰🇿'),
('Uzbekistan','UZB','Asia','Central Asia','Tashkent','Uzbekistani Som (UZS)','Uzbek','Mar–May, Sep–Oct',35,'Easy',9,5,7,2,5,6,'Cultural & History','Samarkand Registan, Bukhara old city, Silk Road heritage, plov cuisine','🇺🇿'),
('Kyrgyzstan','KGZ','Asia','Central Asia','Bishkek','Kyrgyzstani Som (KGS)','Kyrgyz/Russian','Jun–Sep',25,'Easy',6,10,6,2,3,6,'Adventure & Nature','Tian Shan mountains, Song-Kul Lake, yurt stays, Ala Archa national park','🇰🇬'),
('Tajikistan','TJK','Asia','Central Asia','Dushanbe','Tajikistani Somoni (TJS)','Tajik/Russian','May–Sep',25,'Moderate',6,9,5,2,2,5,'Adventure & Nature','Pamir Highway, Wakhan Valley, Iskanderkul Lake, silk-road forts','🇹🇯'),
('Turkmenistan','TKM','Asia','Central Asia','Ashgabat','Turkmenistani Manat','Turkmen','Mar–May, Sep–Oct',40,'Difficult',7,5,5,2,3,4,'Cultural & History','Darvaza Gas Crater, Merv ruins, Ashgabat marble city, Silk Road sites','🇹🇲'),
('Mongolia','MNG','Asia','Eastern Asia','Ulaanbaatar','Mongolian Togrog (MNT)','Mongolian','Jun–Sep',40,'Easy',6,10,5,2,3,6,'Adventure & Nature','Gobi Desert, Mongolian steppe, eagle hunters, Terelj National Park','🇲🇳'),
('Taiwan','TWN','Asia','Eastern Asia','Taipei','New Taiwan Dollar (NT$)','Mandarin','Oct–Apr',80,'Easy',8,7,9,6,8,8,'Food & Cuisine','Taipei night markets, Taroko Gorge, Sun Moon Lake, bubble tea origin','🇹🇼'),
('Iraq','IRQ','Asia','Western Asia','Baghdad','Iraqi Dinar (IQD)','Arabic/Kurdish','Oct–Apr',25,'Difficult',7,4,6,3,3,3,'Cultural & History','Mesopotamia ruins, Erbil Citadel, Najaf, Babylon ancient city','🇮🇶'),
('Yemen','YEM','Asia','Western Asia','Sanaa','Yemeni Rial (YER)','Arabic','—',NULL,'Difficult',7,5,5,4,3,3,'Cultural & History','Socotra Island biodiversity, Sanaa Old City, Wadi Hadramawt','🇾🇪'),
('Afghanistan','AFG','Asia','Southern Asia','Kabul','Afghan Afghani (AFN)','Pashto/Dari','—',NULL,'Difficult',7,6,5,2,3,3,'Cultural & History','Band-e-Amir Lakes, Bamiyan Valley, Wakhan Corridor','🇦🇫'),
('Syria','SYR','Asia','Western Asia','Damascus','Syrian Pound (SYP)','Arabic','—',NULL,'Difficult',8,4,6,3,3,2,'Cultural & History','Palmyra ruins, Damascus old city, Krak des Chevaliers fortress','🇸🇾'),

-- ── AFRICA ────────────────────────────────────────────────────────────────────
('Morocco','MAR','Africa','Northern Africa','Rabat','Moroccan Dirham (MAD)','Arabic/French','Mar–May, Sep–Nov',50,'Easy',9,7,8,6,7,7,'Cultural & History','Marrakech medina, Sahara Desert, Fes tanneries, Atlas Mountains, tajine','🇲🇦'),
('Egypt','EGY','Africa','Northern Africa','Cairo','Egyptian Pound (EGP)','Arabic','Oct–Apr',40,'Easy',10,6,7,7,6,8,'Cultural & History','Pyramids of Giza, Nile cruise, Luxor temples, Red Sea diving, bazaars','🇪🇬'),
('Tunisia','TUN','Africa','Northern Africa','Tunis','Tunisian Dinar (TND)','Arabic/French','Mar–May, Sep–Nov',40,'Easy',8,5,7,8,5,7,'Cultural & History','Sahara dunes, Carthage ruins, Sidi Bou Said, Djerba Island beaches','🇹🇳'),
('Algeria','DZA','Africa','Northern Africa','Algiers','Algerian Dinar (DZD)','Arabic/French','Mar–May, Sep–Oct',30,'Moderate',7,7,6,5,4,5,'Cultural & History','Sahara Desert, Tassili frescoes, Casbah of Algiers, Djemila ruins','🇩🇿'),
('Ethiopia','ETH','Africa','Eastern Africa','Addis Ababa','Ethiopian Birr (ETB)','Amharic','Oct–Feb',25,'Easy',9,8,8,2,4,6,'Cultural & History','Lalibela rock churches, Danakil Depression, Omo Valley tribes, injera','🇪🇹'),
('Kenya','KEN','Africa','Eastern Africa','Nairobi','Kenyan Shilling (KES)','Swahili/English','Jul–Oct, Jan–Feb',80,'Easy',7,10,7,8,5,8,'Adventure & Nature','Masai Mara safari, Mount Kenya, Diani Beach, Nairobi National Park','🇰🇪'),
('Tanzania','TZA','Africa','Eastern Africa','Dodoma','Tanzanian Shilling (TZS)','Swahili/English','Jun–Oct',80,'Easy',7,10,6,9,4,7,'Adventure & Nature','Serengeti migration, Kilimanjaro, Zanzibar beaches, Ngorongoro Crater','🇹🇿'),
('Uganda','UGA','Africa','Eastern Africa','Kampala','Ugandan Shilling (UGX)','English/Swahili','Jun–Sep, Dec–Feb',50,'Easy',6,9,6,3,3,6,'Adventure & Nature','Mountain gorillas, Bwindi Forest, Source of the Nile, Murchison Falls','🇺🇬'),
('Rwanda','RWA','Africa','Eastern Africa','Kigali','Rwandan Franc (RWF)','Kinyarwanda/English','Jun–Sep',80,'Easy',7,9,6,2,4,7,'Adventure & Nature','Gorilla trekking, Nyungwe Forest, Kigali Genocide Memorial, Lake Kivu','🇷🇼'),
('South Africa','ZAF','Africa','Southern Africa','Pretoria','South African Rand (ZAR)','Zulu/Xhosa/English','Oct–Apr',70,'Easy',8,9,8,9,7,9,'Adventure & Nature','Kruger safari, Cape Town Table Mountain, Garden Route, Winelands','🇿🇦'),
('Zimbabwe','ZWE','Africa','Southern Africa','Harare','US Dollar (USD)','English/Shona','Jun–Oct',50,'Easy',7,9,5,3,3,6,'Adventure & Nature','Victoria Falls, Hwange National Park, Great Zimbabwe ruins','🇿🇼'),
('Botswana','BWA','Africa','Southern Africa','Gaborone','Botswana Pula (BWP)','English/Setswana','May–Oct',120,'Easy',6,10,5,3,3,6,'Adventure & Nature','Okavango Delta, Chobe National Park, Kalahari Desert, rhino conservation','🇧🇼'),
('Namibia','NAM','Africa','Southern Africa','Windhoek','Namibian Dollar (NAD)','English/Afrikaans','May–Oct',90,'Easy',6,10,5,4,3,6,'Adventure & Nature','Sossusvlei dunes, Etosha lions, Skeleton Coast, Fish River Canyon','🇳🇦'),
('Zambia','ZMB','Africa','Southern Africa','Lusaka','Zambian Kwacha (ZMW)','English/Bemba','May–Oct',70,'Easy',6,9,5,3,3,5,'Adventure & Nature','Victoria Falls, South Luangwa safari, Kafue National Park','🇿🇲'),
('Mozambique','MOZ','Africa','Eastern Africa','Maputo','Mozambican Metical (MZN)','Portuguese','May–Oct',40,'Easy',5,7,7,9,3,6,'Relaxation & Beach','Bazaruto Archipelago, Quirimbas Islands, Vilanculos, coral reefs','🇲🇿'),
('Madagascar','MDG','Africa','Eastern Africa','Antananarivo','Malagasy Ariary (MGA)','Malagasy/French','Apr–Nov',40,'Easy',6,9,6,7,3,6,'Adventure & Nature','Lemurs, Avenue of the Baobabs, Isalo National Park, Nosy Be island','🇲🇬'),
('Mauritius','MUS','Africa','Eastern Africa','Port Louis','Mauritian Rupee (MUR)','English/French','May–Dec',150,'Easy',6,6,8,10,6,9,'Relaxation & Beach','Turquoise lagoons, Chamarel Seven-Coloured Earth, Black River Gorges','🇲🇺'),
('Seychelles','SYC','Africa','Eastern Africa','Victoria','Seychellois Rupee (SCR)','English/French/Creole','Apr–May, Oct–Nov',300,'Easy',5,7,7,10,4,8,'Relaxation & Beach','Praslin beaches, Vallee de Mai nature reserve, snorkelling, granite boulders','🇸🇨'),
('Ghana','GHA','Africa','Western Africa','Accra','Ghanaian Cedi (GHS)','English','Nov–Mar',40,'Easy',7,5,7,7,5,6,'Cultural & History','Cape Coast Castle, Kakum National Park, Accra street food, Ashanti culture','🇬🇭'),
('Nigeria','NGA','Africa','Western Africa','Abuja','Nigerian Naira (NGN)','English','Nov–Feb',30,'Moderate',7,6,8,5,7,6,'Food & Cuisine','Lagos nightlife, Olumo Rock, Yankari Game Reserve, Nigerian cuisine','🇳🇬'),
('Senegal','SEN','Africa','Western Africa','Dakar','West African CFA Franc','French','Nov–May',40,'Easy',7,6,7,7,5,6,'Cultural & History','Dakar city, Goree Island, Sine Saloum Delta, wrestling culture','🇸🇳'),
('Cameroon','CMR','Africa','Middle Africa','Yaounde','CFA Franc (XAF)','French/English','Nov–Mar',40,'Moderate',7,7,7,5,4,5,'Adventure & Nature','Mount Cameroon, Waza National Park, Limbe wildlife centre, Bamileke culture','🇨🇲'),
('Cabo Verde','CPV','Africa','Western Africa','Praia','Cape Verdean Escudo (CVE)','Portuguese/Creole','Nov–Jul',80,'Easy',6,7,7,9,4,7,'Relaxation & Beach','Sal Island beaches, Santo Antao hiking, Mindelo carnival, water sports','🇨🇻'),
('Ivory Coast','CIV','Africa','Western Africa','Yamoussoukro','West African CFA Franc','French','Nov–Apr',40,'Moderate',6,5,7,6,5,5,'Cultural & History','Yamoussoukro Basilica, Comoe National Park, Grand Bassam heritage','🇨🇮'),
('Sudan','SDN','Africa','Northern Africa','Khartoum','Sudanese Pound (SDG)','Arabic','Oct–Mar',20,'Difficult',7,5,5,4,3,3,'Cultural & History','Meroe pyramids, Nile confluence, Dinder National Park','🇸🇩'),
('Angola','AGO','Africa','Middle Africa','Luanda','Angolan Kwanza (AOA)','Portuguese','May–Sep',80,'Moderate',6,7,6,7,4,5,'Adventure & Nature','Kalandula Falls, Kissama National Park, Luanda Bay, Tunda-Vala cliffs','🇦🇴'),
('Malawi','MWI','Africa','Eastern Africa','Lilongwe','Malawian Kwacha (MWK)','English/Chewa','May–Oct',30,'Easy',5,8,5,7,3,6,'Adventure & Nature','Lake Malawi beaches, Liwonde National Park, Mulanje Mountain, Zomba Plateau','🇲🇼'),
('Eswatini','SWZ','Africa','Southern Africa','Mbabane','Swazi Lilangeni (SZL)','Swati/English','May–Sep',40,'Easy',6,7,5,3,3,6,'Adventure & Nature','Hlane Royal National Park, Swazi cultural villages, Mantenga nature reserve','🇸🇿'),
('Lesotho','LSO','Africa','Southern Africa','Maseru','Lesotho Loti (LSL)','Sotho/English','May–Sep',30,'Easy',5,8,5,2,2,5,'Adventure & Nature','Sani Pass, Maluti Mountains, pony trekking, Ts'ehlanyane National Park','🇱🇸'),
('Libya','LBY','Africa','Northern Africa','Tripoli','Libyan Dinar (LYD)','Arabic','—',NULL,'Difficult',6,5,5,5,3,3,'Cultural & History','Leptis Magna ruins, Sahara dunes, Ghadames old city','🇱🇾'),

-- ── AMERICAS ──────────────────────────────────────────────────────────────────
('United States','USA','Americas','Northern America','Washington D.C.','US Dollar ($)','English','Apr–Jun, Sep–Oct',150,'Easy',8,9,9,8,10,10,'Family Friendly','NYC, Grand Canyon, Yellowstone, Disney World, New Orleans, Hawaii beaches','🇺🇸'),
('Canada','CAN','Americas','Northern America','Ottawa','Canadian Dollar (CA$)','English/French','Jun–Sep, Dec–Feb',130,'Easy',7,10,8,4,8,9,'Adventure & Nature','Niagara Falls, Banff National Park, Quebec City, Northern Lights, maple syrup','🇨🇦'),
('Mexico','MEX','Americas','Central America','Mexico City','Mexican Peso (MX$)','Spanish','Nov–Apr',50,'Easy',9,7,10,9,7,8,'Food & Cuisine','Tulum ruins, Cancun beaches, Mexico City street food, Guanajuato, Copper Canyon','🇲🇽'),
('Brazil','BRA','Americas','South America','Brasilia','Brazilian Real (R$)','Portuguese','Dec–Mar, Jun–Sep',60,'Easy',8,9,9,10,7,8,'Relaxation & Beach','Rio Carnival, Amazon jungle, Iguazu Falls, Pantanal wildlife, Copacabana','🇧🇷'),
('Argentina','ARG','Americas','South America','Buenos Aires','Argentine Peso (ARS)','Spanish','Nov–Mar',50,'Easy',8,9,9,6,7,7,'Adventure & Nature','Patagonia trekking, Iguazu Falls, Buenos Aires tango, Mendoza wine, Andes','🇦🇷'),
('Peru','PER','Americas','South America','Lima','Peruvian Sol (S/)','Spanish/Quechua','May–Oct',50,'Easy',10,9,9,3,5,8,'Cultural & History','Machu Picchu, Colca Canyon, Lima food scene, Nazca Lines, Lake Titicaca','🇵🇪'),
('Colombia','COL','Americas','South America','Bogota','Colombian Peso (COP)','Spanish','Dec–Mar',40,'Easy',8,8,8,8,6,7,'Adventure & Nature','Cartagena walls, Medellin innovation, Tayrona National Park, coffee region','🇨🇴'),
('Chile','CHL','Americas','South America','Santiago','Chilean Peso (CLP)','Spanish','Nov–Mar',70,'Easy',7,10,7,6,6,8,'Adventure & Nature','Torres del Paine, Atacama Desert, Easter Island, Patagonia glaciers','🇨🇱'),
('Bolivia','BOL','Americas','South America','Sucre','Bolivian Boliviano (Bs.)','Spanish','May–Oct',25,'Easy',8,9,6,2,4,6,'Adventure & Nature','Salar de Uyuni, Lake Titicaca, La Paz cable cars, Amazon jungle','🇧🇴'),
('Ecuador','ECU','Americas','South America','Quito','US Dollar ($)','Spanish','Jun–Sep',40,'Easy',7,9,7,7,5,8,'Adventure & Nature','Galapagos Islands, Amazon basin, Quito colonial city, Cotopaxi volcano','🇪🇨'),
('Venezuela','VEN','Americas','South America','Caracas','Venezuelan Bolivar (VES)','Spanish','Jan–May',25,'Difficult',6,8,6,7,3,3,'Adventure & Nature','Angel Falls, Los Roques archipelago, Canaima National Park','🇻🇪'),
('Cuba','CUB','Americas','Caribbean','Havana','Cuban Peso (CUP)','Spanish','Nov–Apr',70,'Moderate',8,5,7,8,5,6,'Cultural & History','Old Havana, vintage cars, Vinales Valley, salsa culture, Trinidad','🇨🇺'),
('Jamaica','JAM','Americas','Caribbean','Kingston','Jamaican Dollar (J$)','English','Nov–Apr',80,'Easy',7,6,8,10,5,8,'Relaxation & Beach','Montego Bay beaches, Blue Mountains, reggae music, jerk cuisine','🇯🇲'),
('Dominican Republic','DOM','Americas','Caribbean','Santo Domingo','Dominican Peso (RD$)','Spanish','Nov–Apr',60,'Easy',6,6,7,10,6,9,'Relaxation & Beach','Punta Cana beaches, whale watching, Samana peninsula, Zona Colonial','🇩🇴'),
('Costa Rica','CRI','Americas','Central America','San Jose','Costa Rican Colon (₡)','Spanish','Dec–Apr',80,'Easy',6,10,7,8,4,9,'Adventure & Nature','Arenal Volcano, Manuel Antonio, cloud forest, zip-lining, sea turtles','🇨🇷'),
('Panama','PAN','Americas','Central America','Panama City','US Dollar ($)','Spanish','Dec–Apr',70,'Easy',7,8,7,8,7,7,'Cultural & History','Panama Canal, Boquete highlands, San Blas Islands, Panama City skyline','🇵🇦'),
('Guatemala','GTM','Americas','Central America','Guatemala City','Guatemalan Quetzal (GTQ)','Spanish','Nov–Apr',35,'Easy',9,7,7,3,4,7,'Cultural & History','Tikal Mayan ruins, Lake Atitlan, Antigua colonial city, Chichicastenango','🇬🇹'),
('Belize','BLZ','Americas','Central America','Belmopan','Belize Dollar (BZD)','English','Dec–Apr',80,'Easy',6,9,6,9,4,8,'Adventure & Nature','Great Blue Hole, Belize Barrier Reef, Mayan ruins, jungle lodges','🇧🇿'),
('Honduras','HND','Americas','Central America','Tegucigalpa','Honduran Lempira (HNL)','Spanish','Dec–Apr',35,'Moderate',7,7,6,8,4,6,'Adventure & Nature','Copan Maya ruins, Roatan island diving, Pico Bonito forest','🇭🇳'),
('Nicaragua','NIC','Americas','Central America','Managua','Nicaraguan Cordoba (NIO)','Spanish','Nov–Apr',25,'Easy',7,7,7,7,4,6,'Cultural & History','Leon cathedral, Ometepe Island, Corn Islands, Granada colonial city','🇳🇮'),
('El Salvador','SLV','Americas','Central America','San Salvador','US Dollar ($)','Spanish','Nov–Apr',35,'Easy',6,7,7,7,4,5,'Adventure & Nature','Ruta de las Flores, Lake Coatepeque, Joya de Ceren, surf breaks','🇸🇻'),
('Puerto Rico','PRI','Americas','Caribbean','San Juan','US Dollar ($)','Spanish/English','Dec–Apr',100,'Easy',7,7,8,9,7,9,'Relaxation & Beach','Old San Juan, El Yunque rainforest, bioluminescent bays, Rincon surfing','🇵🇷'),
('Trinidad and Tobago','TTO','Americas','Caribbean','Port of Spain','Trinidad Dollar (TT$)','English','Jan–May',80,'Easy',7,6,9,9,5,7,'Food & Cuisine','Carnival, Asa Wright nature centre, Tobago reef, doubles street food','🇹🇹'),
('Barbados','BRB','Americas','Caribbean','Bridgetown','Barbadian Dollar (Bds$)','English','Dec–Jun',150,'Easy',6,5,7,10,6,8,'Relaxation & Beach','Harrisons Cave, Oistins fish fry, Crane Beach, rum distilleries','🇧🇧'),
('Haiti','HTI','Americas','Caribbean','Port-au-Prince','Haitian Gourde (HTG)','Haitian Creole/French','Nov–Mar',20,'Difficult',6,5,6,7,3,3,'Cultural & History','Citadelle Laferriere, Sans-Souci Palace, Iron Market, Labadee beach','🇭🇹'),
('Paraguay','PRY','Americas','South America','Asuncion','Paraguayan Guarani (PYG)','Spanish/Guarani','Apr–Sep',25,'Easy',5,5,6,2,4,5,'Cultural & History','Jesuit ruins, Itaipu Dam, Chaco wilderness, Asuncion colonial centre','🇵🇾'),
('Uruguay','URY','Americas','South America','Montevideo','Uruguayan Peso (UYU)','Spanish','Dec–Mar',60,'Easy',6,5,7,7,6,7,'Relaxation & Beach','Punta del Este beaches, Colonia del Sacramento, Montevideo markets','🇺🇾'),
('Guyana','GUY','Americas','South America','Georgetown','Guyanese Dollar (GYD)','English','Sep–Feb',40,'Easy',5,8,5,3,3,5,'Adventure & Nature','Kaieteur Falls, Rupununi savannah, Iwokrama rainforest, Guiana Highlands','🇬🇾'),
('Suriname','SUR','Americas','South America','Paramaribo','Surinamese Dollar (SRD)','Dutch','Feb–Apr, Sep–Nov',40,'Easy',6,7,6,4,3,5,'Cultural & History','Paramaribo UNESCO old city, Central Suriname Nature Reserve, jungle lodges','🇸🇷'),

-- ── OCEANIA ───────────────────────────────────────────────────────────────────
('Australia','AUS','Oceania','Australia and New Zealand','Canberra','Australian Dollar (A$)','English','Sep–Nov, Mar–May',150,'Easy',7,10,8,10,8,10,'Adventure & Nature','Great Barrier Reef, Sydney Opera House, Uluru, Great Ocean Road, kangaroos','🇦🇺'),
('New Zealand','NZL','Oceania','Australia and New Zealand','Wellington','New Zealand Dollar (NZ$)','English/Maori','Dec–Feb',130,'Easy',6,10,7,8,6,9,'Adventure & Nature','Fiordland, Hobbiton, Milford Sound, Queenstown adventure, Maori culture','🇳🇿'),
('Fiji','FJI','Oceania','Melanesia','Suva','Fijian Dollar (FJ$)','English/Fijian','May–Oct',100,'Easy',6,7,7,10,4,9,'Relaxation & Beach','Coral reefs, overwater resorts, Yasawa Islands, Kava ceremonies','🇫🇯'),
('Papua New Guinea','PNG','Oceania','Melanesia','Port Moresby','Kina (PGK)','English/Tok Pisin','May–Oct',80,'Moderate',6,9,6,6,3,4,'Adventure & Nature','Kokoda Trail, Sepik River tribes, coral reefs, Highlands festivals','🇵🇬'),
('Samoa','WSM','Oceania','Polynesia','Apia','Samoan Tala (WST)','Samoan/English','May–Oct',60,'Easy',6,7,7,9,3,7,'Relaxation & Beach','To Sua trench, Lalomanu beach, fale stays, Samoan culture','🇼🇸'),
('Tonga','TON','Oceania','Polynesia','Nukualofa','Tongan Paanga (TOP)','Tongan/English','May–Oct',80,'Easy',6,7,6,9,3,7,'Relaxation & Beach','Humpback whale swimming, Hatafu Beach, ancient Haamonga trilithon','🇹🇴'),
('Vanuatu','VUT','Oceania','Melanesia','Port Vila','Vanuatu Vatu (VUV)','English/French/Bislama','Apr–Oct',100,'Easy',6,8,6,9,3,7,'Adventure & Nature','Yasur volcano, blue holes, ni-Vanuatu culture, bungee jumping origin','🇻🇺'),
('Solomon Islands','SLB','Oceania','Melanesia','Honiara','Solomon Islands Dollar (SBD)','English/Pijin','May–Oct',60,'Easy',5,8,5,8,2,5,'Adventure & Nature','WWII wrecks diving, Marovo Lagoon, indigenous kastom, rainforests','🇸🇧'),
('Palau','PLW','Oceania','Micronesia','Ngerulmud','US Dollar ($)','Palauan/English','Nov–Apr',150,'Easy',5,9,5,10,3,7,'Relaxation & Beach','Jellyfish Lake, Blue Corner diving, Rock Islands, pristine coral reefs','🇵🇼'),
('Micronesia','FSM','Oceania','Micronesia','Palikir','US Dollar ($)','English','Jan–Mar',80,'Easy',5,8,5,8,2,5,'Adventure & Nature','Truk Lagoon WWII wrecks, Nan Madol ruins, pristine atolls, mangroves','🇫🇲'),
('Kiribati','KIR','Oceania','Micronesia','South Tarawa','Australian Dollar (A$)','English/Gilbertese','Apr–Oct',60,'Easy',5,6,5,8,2,5,'Relaxation & Beach','Gilbert Islands atolls, Phoenix Islands marine reserve, traditional culture','🇰🇮'),
('Marshall Islands','MHL','Oceania','Micronesia','Majuro','US Dollar ($)','Marshallese/English','Dec–Apr',80,'Easy',5,7,5,8,2,5,'Relaxation & Beach','Bikini Atoll UNESCO site, pristine lagoons, WWII history, traditional navigation','🇲🇭'),
('Tuvalu','TUV','Oceania','Polynesia','Funafuti','Australian Dollar (A$)','Tuvaluan/English','Mar–Oct',80,'Moderate',5,5,5,8,2,5,'Relaxation & Beach','Funafuti atoll, traditional dancing, WWII relics, climate-change awareness','🇹🇻'),
('Nauru','NRU','Oceania','Micronesia','Yaren','Australian Dollar (A$)','Nauruan/English','May–Oct',100,'Moderate',4,5,4,7,2,4,'Relaxation & Beach','World smallest island nation, Command Ridge, Anibare Bay, phosphate history','🇳🇷');

-- ==========================================
-- 5. PERFORMANCE INDEXES
-- ==========================================
CREATE INDEX idx_dest_region    ON destinations (region);
CREATE INDEX idx_dest_category  ON destinations (category_primary);
CREATE INDEX idx_dest_country   ON destinations (country_name);
CREATE INDEX idx_dest_visa      ON destinations (visa_ease);

-- ==========================================
-- 6. HELPER VIEW – Category Leaderboard
-- ==========================================
CREATE VIEW top_destinations_by_category AS
SELECT
    country_name,
    flag_emoji,
    region,
    category_primary,
    score_cultural,
    score_adventure,
    score_food,
    score_beach,
    score_shopping,
    score_family,
    ROUND((score_cultural + score_adventure + score_food +
           score_beach + score_shopping + score_family) / 6.0, 1) AS overall_score
FROM destinations
ORDER BY overall_score DESC;
