INSERT INTO cust_pc (pc_name, pc_price)
VALUES
    ('Gaming Beast', 1500),
    ('Productivity Powerhouse', 1200),
    ('Compact Workstation', 1100),
    ('Entertainment Center', 1300),
    ('Designers Dream', 1400),
    ('Office Pro', 950),
    ('Multimedia Marvel', 1250),
    ('Student Special', 800),
    ('Home Theater Hub', 1350),
    ('Ultra-Portable', 900);


-- Insert CPUs
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('Intel Core i7-12700K', 'Intel', 20),
    ('AMD Ryzen 9 5900X', 'AMD', 18),
    ('Intel Core i5-11600K', 'Intel', 15),
    ('AMD Ryzen 5 5600X', 'AMD', 17);

-- Insert GPUs
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('NVIDIA GeForce RTX 3080', 'NVIDIA', 10),
    ('AMD Radeon RX 6800 XT', 'AMD', 12),
    ('NVIDIA GeForce RTX 3060', 'NVIDIA', 14),
    ('AMD Radeon RX 6700 XT', 'AMD', 16);

-- Insert RAM modules
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('Corsair Vengeance LPX 16GB DDR4', 'Corsair', 30),
    ('Crucial Ballistix 32GB DDR4', 'Crucial', 25),
    ('G.Skill Ripjaws V 8GB DDR4', 'G.Skill', 22),
    ('Kingston HyperX 64GB DDR4', 'Kingston', 28);

-- Insert Storage drives
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('Samsung 970 EVO 1TB NVMe SSD', 'Samsung', 40),
    ('Western Digital WD Black 2TB HDD', 'WD', 35),
    ('Crucial MX500 500GB SATA SSD', 'Crucial', 32),
    ('Seagate Barracuda 4TB HDD', 'Seagate', 38);

-- Insert PSUs
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('EVGA 1000W 80+ Gold PSU', 'EVGA', 8),
    ('Corsair RM1000x 1000W 80+ Gold PSU', 'Corsair', 10),
    ('Seasonic Prime TX-1000 1000W 80+ Titanium PSU', 'Seasonic', 6),
    ('Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU', 'Thermaltake', 12),
    ('EVGA 750W 80+ Gold PSU', 'EVGA', 20),
    ('Corsair RM850x 850W 80+ Gold PSU', 'Corsair', 18),
    ('Seasonic Focus GX-650 650W 80+ Gold PSU', 'Seasonic', 15),
    ('Thermaltake Toughpower GF1 750W 80+ Gold PSU', 'Thermaltake', 17);

-- Insert CPU Coolers
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('Noctua NH-D15 CPU Cooler', 'Noctua', 10),
    ('Cooler Master Hyper 212 RGB', 'Cooler Master', 12),
    ('NZXT Kraken X63 280mm AIO Cooler', 'NZXT', 14),
    ('Be Quiet! Dark Rock Pro 4', 'Be Quiet!', 16);

-- Insert PC Cases
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('Fractal Design Meshify C', 'Fractal Design', 30),
    ('NZXT H510i', 'NZXT', 25),
    ('Corsair 4000D Airflow', 'Corsair', 22),
    ('Lian Li Lancool II Mesh', 'Lian Li', 28);

-- Insert Case Fans
INSERT INTO cust_components (part_name, part_manufacturer, part_stock)
VALUES
    ('Noctua NF-A12x25 PWM', 'Noctua', 40),
    ('Corsair LL120 RGB', 'Corsair', 35),
    ('Be Quiet! Silent Wings 3 140mm', 'Be Quiet!', 32),
    ('Arctic P12 PWM', 'Arctic', 38);


--Making PCs

--gaming beast
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 1);  -- CPU: Intel Core i7-12700K
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 5);  -- GPU: NVIDIA GeForce RTX 3080
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 13); -- Storage: Samsung 970 EVO 1TB NVMe SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 17); -- PSU: EVGA 1000W 80+ Gold PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 21); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 25); -- Case: Fractal Design Meshify C
INSERT INTO cust_spec (pc_id, part_id) VALUES (1, 29); -- Fans: Noctua NF-A12x25 PWM (x2)

--Productivity powerhouse
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 2);  -- CPU: AMD Ryzen 9 5900X
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 10); -- RAM: Crucial Ballistix 32GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 14); -- Storage: Western Digital WD Black 2TB HDD
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 17); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 23); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 27); -- Case: NZXT H510i
INSERT INTO cust_spec (pc_id, part_id) VALUES (2, 31); -- Fans: Corsair LL120 RGB (x2)

-- Compact Workstation
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 15); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 18); -- PSU: Seasonic Prime TX-1000 1000W 80+ Titanium PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 28); -- Case: Corsair 4000D Airflow
INSERT INTO cust_spec (pc_id, part_id) VALUES (3, 32); -- Fans: Be Quiet! Silent Wings 3 140mm (x2)

--Entertainment Center
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 4);  -- CPU: AMD Ryzen 5 5600X
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 8);  -- GPU: AMD Radeon RX 6700 XT
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 12); -- RAM: Kingston HyperX 64GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 16); -- Storage: Seagate Barracuda 4TB HDD
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 17); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 22); -- Cooler: Be Quiet! Dark Rock Pro 4
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 26); -- Case: Lian Li Lancool II Mesh
INSERT INTO cust_spec (pc_id, part_id) VALUES (4, 30); -- Fans: Arctic P12 PWM (x2)

--designer's dream
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 5);  -- GPU: NVIDIA GeForce RTX 3080
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 15); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 26); -- Case: Corsair 4000D Airflow
INSERT INTO cust_spec (pc_id, part_id) VALUES (5, 30); -- Fans: Be Quiet! Silent Wings 3 140mm (x2)

--office pro
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 27); -- Case: NZXT H510i
INSERT INTO cust_spec (pc_id, part_id) VALUES (6, 31); -- Fans: Corsair LL120 RGB (x2)

--Multimedia Marvel
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 1);  -- CPU: Intel Core i7-12700K
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 13); -- Storage: Samsung 970 EVO 1TB NVMe SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 27); -- Case: NZXT H510i
INSERT INTO cust_spec (pc_id, part_id) VALUES (7, 31); -- Fans: Corsair LL120 RGB (x2)

--Student Special
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 18); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 22); -- Cooler: Cooler Master Hyper 212 RGB
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 27); -- Case: NZXT H510i
INSERT INTO cust_spec (pc_id, part_id) VALUES (8, 31); -- Fans: Corsair LL120 RGB (x2)

--Home Theatre Hub
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 2);  -- CPU: AMD Ryzen 9 5900X
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 10); -- RAM: Crucial Ballistix 32GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 14); -- Storage: Western Digital WD Black 2TB HDD
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 20); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 27); -- Case: NZXT H510i
INSERT INTO cust_spec (pc_id, part_id) VALUES (9, 31); -- Fans: Corsair LL120 RGB (x2)

--Ultra-Portable
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 20); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 22); -- Cooler: Cooler Master Hyper 212 RGB
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 27); -- Case: NZXT H510i
INSERT INTO cust_spec (pc_id, part_id) VALUES (10, 31); -- Fans: Corsair LL120 RGB (x2)







