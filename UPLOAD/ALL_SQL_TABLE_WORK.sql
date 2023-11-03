drop table cust_supplycomponents;
drop table cust_specs;
drop table cust_order;
drop table cust_buyer;
drop table cust_pc;
drop table cust_components;
drop table cust_supplierdetails;


CREATE TABLE cust_buyer (
    buyer_id      serial primary key,
    buyer_name    VARCHAR(100) NOT NULL,
    buyer_address VARCHAR(255) NOT NULL,
    buyer_email   VARCHAR(100) unique NOT NULL,
    buyer_phone   VARCHAR(20)
);

CREATE TABLE cust_components (
    part_id           serial primary key,
    part_name         VARCHAR(100) NOT NULL,
    part_manufacturer VARCHAR(100)NOT NULL,
    part_stock        INTEGER NOT NULL
);

CREATE TABLE cust_pc (
    pc_id    serial primary key,
    pc_name  VARCHAR(255) NOT NULL,
    pc_price INTEGER NOT NULL
);

CREATE TABLE cust_supplierdetails (
    supplier_id      serial primary key,
    supplier_address VARCHAR(255) NOT NULL,
    supplier_phone   VARCHAR(20) NOT NULL,
    supplier_name    VARCHAR(100) unique NOT NULL
);

CREATE TABLE cust_order (
    pc_id       INTEGER references cust_pc(pc_id),
    buyer_id    INTEGER references cust_buyer(buyer_id),
    order_date  DATE NOT NULL,
    order_email VARCHAR(100) NOT null,
    complete_status varchar(100) default 'In progress'
);  

CREATE TABLE cust_specs (
    pc_id   INTEGER references cust_pc(pc_id),
    part_id INTEGER references cust_components(part_id)
);   

CREATE TABLE cust_supplycomponents (
    part_id       integer references cust_components(part_id),
    supplier_id   integer references cust_supplierDetails(supplier_id),
    supplied_date DATE not null,
    isWorking 	  varchar(100) default 'True'
);

--INSERTS FOR ALL TABLES
--CUSTOMER INSERTS
insert into cust_buyer (buyer_name, buyer_address, buyer_email)
values ('William', 'Lissadell, Piedmont, Riverstown, Dundalk, Co.Louth', 'c21437002@mytudublin.ie');
insert into cust_buyer (buyer_name, buyer_address, buyer_email)
values ('Paul', '208, DaTrees, Dublin 4', 'c21359216@mytudublin.ie');
insert into cust_buyer (buyer_name, buyer_address, buyer_email, buyer_phone)
values ('Ryan', 'Hikeasle, Kanhdahar, Afghanistan, 0H10712', 'c21431604@mytudublin.ie', '087-420-6969');
insert into cust_buyer (buyer_name, buyer_address, buyer_email)
values ('Liam', 'DaStx, Ulaanbaatar, Mongolia', 'c21322051@mytudublin.ie');

--GAMING PC INSERTS
INSERT INTO cust_pc (pc_name, pc_price)
VALUES
    ('Gaming Beast', 1500),
    ('Productivity Powerhouse', 1200),
    ('Compact Workstation', 1100),
    ('Entertainment Center', 1300),
    ('Designers Dream', 1400),
    ('Office Pro', 950),
    ('Multimedia Marvel', 1250),
    ('Student specsial', 800),
    ('Home Theater Hub', 1350),
    ('Ultra-Portable', 900);

--PARTS INSERTS
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

--MAKING PC'S THEMSELVES
--gaming beast
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 1);  -- CPU: Intel Core i7-12700K
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 5);  -- GPU: NVIDIA GeForce RTX 3080
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 13); -- Storage: Samsung 970 EVO 1TB NVMe SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 17); -- PSU: EVGA 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 21); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 25); -- Case: Fractal Design Meshify C
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 29); -- Fans: Noctua NF-A12x25 PWM (x2)

--Productivity powerhouse
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 2);  -- CPU: AMD Ryzen 9 5900X
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 10); -- RAM: Crucial Ballistix 32GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 14); -- Storage: Western Digital WD Black 2TB HDD
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 17); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 23); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 27); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 31); -- Fans: Corsair LL120 RGB (x2)

-- Compact Workstation
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 15); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 18); -- PSU: Seasonic Prime TX-1000 1000W 80+ Titanium PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 28); -- Case: Corsair 4000D Airflow
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 32); -- Fans: Be Quiet! Silent Wings 3 140mm (x2)

--Entertainment Center
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 4);  -- CPU: AMD Ryzen 5 5600X
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 8);  -- GPU: AMD Radeon RX 6700 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 12); -- RAM: Kingston HyperX 64GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 16); -- Storage: Seagate Barracuda 4TB HDD
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 17); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 22); -- Cooler: Be Quiet! Dark Rock Pro 4
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 26); -- Case: Lian Li Lancool II Mesh
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 30); -- Fans: Arctic P12 PWM (x2)

--designer's dream
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 5);  -- GPU: NVIDIA GeForce RTX 3080
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 15); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 26); -- Case: Corsair 4000D Airflow
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 30); -- Fans: Be Quiet! Silent Wings 3 140mm (x2)

--office pro
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 27); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 31); -- Fans: Corsair LL120 RGB (x2)

--Multimedia Marvel
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 1);  -- CPU: Intel Core i7-12700K
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 13); -- Storage: Samsung 970 EVO 1TB NVMe SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 27); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 31); -- Fans: Corsair LL120 RGB (x2)

--Student specsial
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 18); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 22); -- Cooler: Cooler Master Hyper 212 RGB
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 27); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 31); -- Fans: Corsair LL120 RGB (x2)

--Home Theatre Hub
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 2);  -- CPU: AMD Ryzen 9 5900X
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 10); -- RAM: Crucial Ballistix 32GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 14); -- Storage: Western Digital WD Black 2TB HDD
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 20); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 24); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 27); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 31); -- Fans: Corsair LL120 RGB (x2)

--Ultra-Portable
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 20); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 22); -- Cooler: Cooler Master Hyper 212 RGB
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 27); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 31); -- Fans: Corsair LL120 RGB (x2)


--CREATING CUSTOMER ORDERS
insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (1, 1, '01/11/2023', 'c21437002@mytudublin.ie');
insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (5, 1, '12/08/2023', 'c21437002@mytudublin.ie');
insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (8, 2, '12/03/2023', 'c21359216@mytudublin.ie');
insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (9, 3, '05/06/2023', 'c21431604@mytudublin.ie');
insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (3, 4, '12/12/2023', 'c21322051@mytudublin.ie');
insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (3, 4, '12/12/2023', 'c21322051@mytudublin.ie');

--CREATING SUPPLIERS
insert into cust_supplierdetails (supplier_name, supplier_phone, supplier_address)
values('Pauls Workshop', '087-444-1920', '171 The Vale, WhiteValley, Dublin');
insert into cust_supplierdetails (supplier_name, supplier_phone, supplier_address)
values('Williams Wondorium', '087-982-2083', '26, The Rock, Lily Valley');
insert into cust_supplierdetails (supplier_name, supplier_phone, supplier_address)
values('WhiteRock Games', '088-256-6983', '18, WhiteRock Ave, Dublin 19');
insert into cust_supplierdetails (supplier_name, supplier_phone, supplier_address)
values('GamesTation', '093-555-2124', 'The Levy, Pont Point, Charlesland USA');

--CREATING SUPPLIER STOCK
insert into cust_supplycomponents values (1,1,'11-04-2021');
insert into cust_supplycomponents values (2,1,'11-10-2022');
insert into cust_supplycomponents values (3,1,'11-9-2023');
insert into cust_supplycomponents values (4,1,'01-11-2019');
insert into cust_supplycomponents values (5,1,'11-12-2015');
insert into cust_supplycomponents values (6,1,'11-03-2013');
insert into cust_supplycomponents values (7,1,'11-09-2012');
insert into cust_supplycomponents values (8,2,'11-05-2015');
insert into cust_supplycomponents values (9,2,'11-08-2013');
insert into cust_supplycomponents values (10,2,'11-03-2011');
insert into cust_supplycomponents values (11,2,'11-12-2015');
insert into cust_supplycomponents values (12,2,'11-04-2017');
insert into cust_supplycomponents values (13,2,'11-07-2022');
insert into cust_supplycomponents values (14,2,'11-06-2101');
insert into cust_supplycomponents values (15,2,'11-02-3041');
insert into cust_supplycomponents values (16,4,'11-06-2022');
insert into cust_supplycomponents values (17,3,'11-06-2002');
insert into cust_supplycomponents values (18,3,'11-06-1011');
insert into cust_supplycomponents values (19,4,'11-03-0');
insert into cust_supplycomponents values (20,4,'11-03-2045');
insert into cust_supplycomponents values (21,4,'11-10-4937');
insert into cust_supplycomponents values (22,4,'11-09-4780');
insert into cust_supplycomponents values (23,1,'11-03-2234');
insert into cust_supplycomponents values (24,1,'1-01-1245');
insert into cust_supplycomponents values (25,1,'7-02-1356');
insert into cust_supplycomponents values (26,1,'8-03-4575');
insert into cust_supplycomponents values (27,2,'6-04-3945');
insert into cust_supplycomponents values (28,4,'6-06-9281');
insert into cust_supplycomponents values (29,2,'5-07-1463');
insert into cust_supplycomponents values (30,3,'3-07-2145');
insert into cust_supplycomponents values (31,1,'2-07-4224');
insert into cust_supplycomponents values (32,1,'5-09-5463');
insert into cust_supplycomponents values (33,3,'6-02-2346');
insert into cust_supplycomponents values (34,2,'2-02-5214');
insert into cust_supplycomponents values (35,4,'6-06-2124');
insert into cust_supplycomponents values (36,1,'7-06-2993');

--GRANTS FOR ROLES 
--Grant usages for Will, Ryan and Paul
grant usage on schema "Cust857B" to "C21437002";
grant usage on schema "Cust857B" to "C21431604";
grant usage on schema "Cust857B" to "C21359216";


--William as Customer
grant select on table cust_buyer to "C21437002";
grant insert on table cust_buyer to "C21437002";
GRANT USAGE ON SEQUENCE cust_buyer_buyer_id_seq TO "C21437002";
--
grant select on table cust_order to "C21437002";
grant insert on table cust_order to "C21437002";
--
grant select on table cust_pc to "C21437002";
--
GRANT EXECUTE ON FUNCTION addOrder TO "C21437002";


--Ryan as PC technician
grant select on table cust_pc to "C21431604";
grant insert on table cust_pc to "C21431604";
grant update on table cust_pc to "C21431604";
GRANT USAGE ON SEQUENCE cust_pc_pc_id_seq TO "C21431604";
--
grant select on table cust_specs to "C21431604";
grant insert on table cust_specs to "C21431604";
grant update on table cust_specs to "C21431604";
--
grant select on table cust_components to "C21431604";
grant insert on table cust_components to "C21431604";
grant update on table cust_components to "C21431604";
GRANT USAGE ON SEQUENCE cust_components_part_id_seq TO "C21431604";
--
grant execute on function makePC to "C21431604"

--Paul as supplier acquisition
grant select on table cust_supplierdetails to "C21359216";
grant insert on table cust_supplierdetails to "C21359216";
grant usage on sequence cust_supplierdetails_supplier_id_seq to "C21359216";
--
grant select on table cust_supplycomponents to "C21359216";
grant insert on table cust_supplycomponents to "C21359216";
--
grant select on table cust_components to "C21359216";
grant insert on table cust_components to "C21359216";
grant usage on sequence cust_components_part_id_seq to "C21359216";
--
GRANT EXECUTE ON FUNCTION addsupplierdetails TO "C21359216";
grant update on table supplier_log to "C21359216";
grant insert on table supplier_log to "C21359216";
grant select on table supplier_log to "C21359216";