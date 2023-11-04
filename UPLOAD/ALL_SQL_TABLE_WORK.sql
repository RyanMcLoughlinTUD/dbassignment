drop table cust_supplycomponents;
drop table cust_specs;
drop table cust_order;
drop table cust_customPC;
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
    part_type		  VARCHAR(100) NOT NULL,
    part_manufacturer VARCHAR(100)NOT NULL,
    part_stock        INTEGER NOT NULL,
    part_price 		  integer NOT null
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

create table cust_customPC(
	buyer_id      INTEGER references cust_buyer(buyer_id),
	part_id 	  INTEGER references cust_components(part_id),
	order_date    date not null,
	order_email   varchar(100) not null,
	ShippingStatus varchar(100) default 'In progress'
);

select buyer_name, part_type, part_name, part_price from cust_buyer
join cust_customPC using(buyer_id)
join cust_components using(part_id);

select pc_name, pc_price, part_name, part_price, part_type, part_id from cust_pc
join cust_specs using(pc_id)
join cust_components using(part_id)
where pc_name = 'Gaming Beast';

select * from cust_components;

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
-- Insert CPUs with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('Intel Core i7-12700K', 'Intel', 'CPU', 20, 350.00),
    ('AMD Ryzen 9 5900X', 'AMD', 'CPU', 18, 400.00),
    ('Intel Core i5-11600K', 'Intel', 'CPU', 15, 250.00),
    ('AMD Ryzen 5 5600X', 'AMD', 'CPU', 17, 300.00);

-- Insert GPUs with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('NVIDIA GeForce RTX 3080', 'NVIDIA', 'GPU', 10, 800.00),
    ('AMD Radeon RX 6800 XT', 'AMD', 'GPU', 12, 750.00),
    ('NVIDIA GeForce RTX 3060', 'NVIDIA', 'GPU', 14, 400.00),
    ('AMD Radeon RX 6700 XT', 'AMD', 'GPU', 16, 500.00);

-- Insert RAM modules with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('Corsair Vengeance LPX 16GB DDR4', 'Corsair', 'RAM', 30, 80.00),
    ('Crucial Ballistix 32GB DDR4', 'Crucial', 'RAM', 25, 120.00),
    ('G.Skill Ripjaws V 8GB DDR4', 'G.Skill', 'RAM', 22, 60.00),
    ('Kingston HyperX 64GB DDR4', 'Kingston', 'RAM', 28, 160.00);

-- Insert Storage drives with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('Samsung 970 EVO 1TB NVMe SSD', 'Samsung', 'Storage', 40, 150.00),
    ('Western Digital WD Black 2TB HDD', 'WD', 'Storage', 35, 80.00),
    ('Crucial MX500 500GB SATA SSD', 'Crucial', 'Storage', 32, 70.00),
    ('Seagate Barracuda 4TB HDD', 'Seagate', 'Storage', 38, 100.00);

-- Insert PSUs with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('EVGA 1000W 80+ Gold PSU', 'EVGA', 'PSU', 8, 150.00),
    ('Corsair RM1000x 1000W 80+ Gold PSU', 'Corsair', 'PSU', 10, 160.00),
    ('Seasonic Prime TX-1000 1000W 80+ Titanium PSU', 'Seasonic', 'PSU', 6, 200.00),
    ('Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU', 'Thermaltake', 'PSU', 12, 180.00),
    ('EVGA 750W 80+ Gold PSU', 'EVGA', 'PSU', 20, 90.00),
    ('Corsair RM850x 850W 80+ Gold PSU', 'Corsair', 'PSU', 18, 120.00),
    ('Seasonic Focus GX-650 650W 80+ Gold PSU', 'Seasonic', 'PSU', 15, 80.00),
    ('Thermaltake Toughpower GF1 750W 80+ Gold PSU', 'Thermaltake', 'PSU', 17, 100.00);

-- Insert CPU Coolers with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('Noctua NH-D15 CPU Cooler', 'Noctua', 'CPU Cooler', 10, 90.00),
    ('Cooler Master Hyper 212 RGB', 'Cooler Master', 'CPU Cooler', 12, 50.00),
    ('NZXT Kraken X63 280mm AIO Cooler', 'NZXT', 'CPU Cooler', 14, 120.00),
    ('Be Quiet! Dark Rock Pro 4', 'Be Quiet!', 'CPU Cooler', 16, 80.00);

-- Insert PC Cases with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('Fractal Design Meshify C', 'Fractal Design', 'Case', 30, 100.00),
    ('NZXT H510i', 'NZXT', 'Case', 25, 120.00),
    ('Corsair 4000D Airflow', 'Corsair', 'Case', 22, 80.00),
    ('Lian Li Lancool II Mesh', 'Lian Li', 'Case', 28, 110.00);

-- Insert Case Fans with prices
INSERT INTO cust_components (part_name, part_manufacturer, part_type, part_stock, part_price)
VALUES
    ('Noctua NF-A12x25 PWM', 'Noctua', 'Fans', 40, 20.00),
    ('Corsair LL120 RGB', 'Corsair', 'Fans', 35, 30.00),
    ('Be Quiet! Silent Wings 3 140mm', 'Be Quiet!', 'Fans', 32, 25.00),
    ('Arctic P12 PWM', 'Arctic', 'Fans', 38, 15.00);


--MAKING PC'S THEMSELVES
--gaming beast
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 1);  -- CPU: Intel Core i7-12700K
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 5);  -- GPU: NVIDIA GeForce RTX 3080
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 13); -- Storage: Samsung 970 EVO 1TB NVMe SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 17); -- PSU: EVGA 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 25); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 30); -- Case: Fractal Design Meshify C
INSERT INTO cust_specs (pc_id, part_id) VALUES (1, 33); -- Fans: Noctua NF-A12x25 PWM (x2)


--Productivity powerhouse
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 2);  -- CPU: AMD Ryzen 9 5900X
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 10); -- RAM: Crucial Ballistix 32GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 14); -- Storage: Western Digital WD Black 2TB HDD
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 18); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 27); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 32); -- Case: Lian Li Lancool II Mesh
INSERT INTO cust_specs (pc_id, part_id) VALUES (2, 34); -- Fans: Corsair LL120 RGB

-- Compact Workstation
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 15); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 19); -- PSU: Seasonic Prime TX-1000 1000W 80+ Titanium PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 25); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 30); -- case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (3, 33); -- Fans: Noctua NF-A12x25 PWM

--Entertainment Center
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 4);  -- CPU: AMD Ryzen 5 5600X
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 8);  -- GPU: AMD Radeon RX 6700 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 12); -- RAM: Kingston HyperX 64GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 16); -- Storage: Seagate Barracuda 4TB HDD
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 20); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 28); -- Cooler: Be Quiet! Dark Rock Pro 4
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 31); -- Case: Corsair 4000D Airflow
INSERT INTO cust_specs (pc_id, part_id) VALUES (4, 35); -- Fans: Be Quiet! Silent Wings 3 140mm

--designer's dream
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 5);  -- GPU: NVIDIA GeForce RTX 3080
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 15); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 25); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 32); -- case: Lian Li Lancool II Mesh
INSERT INTO cust_specs (pc_id, part_id) VALUES (5, 33); -- Fans: Noctua NF-A12x25 PWM

--office pro
select pc_name, pc_price, part_name, part_price, part_type, part_id from cust_pc
join cust_specs using(pc_id)
join cust_components using(part_id)
where pc_name = 'Office Pro';

INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 18); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 28); -- Cooler: Be Quiet! Dark Rock Pro 4
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 30); -- Case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (6, 35); -- Fans: Be Quiet! Silent Wings 3 140mm

--Multimedia Marvel
select pc_name, pc_price, part_name, part_price, part_type, part_id from cust_pc
join cust_specs using(pc_id)
join cust_components using(part_id)
where pc_name = 'Multimedia Marvel';

INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 1);  -- CPU: Intel Core i7-12700K
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 9);  -- RAM: Corsair Vengeance LPX 16GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 13); -- Storage: Samsung 970 EVO 1TB NVMe SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 20); -- PSU: Thermaltake Toughpower Grand RGB 1000W 80+ Platinum PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 25); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 30); -- Case: Fractal Design Meshify C
INSERT INTO cust_specs (pc_id, part_id) VALUES (7, 34); -- Fans: Corsair LL120 RGB

--Student special
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 18); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 26); -- Cooler: Cooler Master Hyper 212 RGB
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 32); -- Case: Lian Li Lancool II Mesh
INSERT INTO cust_specs (pc_id, part_id) VALUES (8, 36); -- Fans: Arctic P12 PWM

--Home Theatre Hub
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 2);  -- CPU: AMD Ryzen 9 5900X
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 6);  -- GPU: AMD Radeon RX 6800 XT
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 10); -- RAM: Crucial Ballistix 32GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 14); -- Storage: Western Digital WD Black 2TB HDD
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 18); -- PSU: Corsair RM1000x 1000W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 27); -- Cooler: NZXT Kraken X63 280mm AIO Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 30); -- case: NZXT H510i
INSERT INTO cust_specs (pc_id, part_id) VALUES (9, 33); -- Fans: Noctua NF-A12x25 PWM

--Ultra-Portable
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 3);  -- CPU: Intel Core i5-11600K
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 7);  -- GPU: NVIDIA GeForce RTX 3060
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 11); -- RAM: G.Skill Ripjaws V 8GB DDR4
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 14); -- Storage: Crucial MX500 500GB SATA SSD
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 18); -- PSU: EVGA 750W 80+ Gold PSU
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 25); -- Cooler: Noctua NH-D15 CPU Cooler
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 32); -- Case: Lian Li Lancool II Mesh
INSERT INTO cust_specs (pc_id, part_id) VALUES (10, 35); -- Fans: Be Quiet! Silent Wings 3 140mm

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

--insert the custom component orders
insert into cust_customPC values(1, 2, '10/10/23', 'C21437002@mytudublin.ie');
insert into cust_customPC values(1, 5, '10/10/23', 'C21437002@mytudublin.ie');
insert into cust_customPC values(1, 12, '10/10/23', 'C21437002@mytudublin.ie');
insert into cust_customPC values(1, 18, '10/10/23', 'C21437002@mytudublin.ie');
insert into cust_customPC values(1, 29, '10/10/23', 'C21437002@mytudublin.ie');
insert into cust_customPC values(1, 35, '10/10/23', 'C21437002@mytudublin.ie');

--GRANTS FOR ROLES 
--Grant usages for Will, Ryan and Paul
grant usage on schema "Cust857B" to "C21437002";
grant usage on schema "Cust857B" to "C21431604";
grant usage on schema "Cust857B" to "C21359216";

--William as Customer, can see and add customer to customer table
grant select on table cust_buyer to "C21437002";
grant insert on table cust_buyer to "C21437002";
GRANT USAGE ON SEQUENCE cust_buyer_buyer_id_seq TO "C21437002";
-- can see and insert a new order
grant select on table cust_order to "C21437002";
grant insert on table cust_order to "C21437002";
-- can view prebuilts
grant select on table cust_pc to "C21437002";
-- can view components
grant select on table cust_components to "C21437002"
-- can insert and view order of specific components
grant select on table cust_customPC to "C21437002" 
grant insert on table cust_customPC to "C21437002" 
-- can use the addOrder function
GRANT EXECUTE ON FUNCTION addOrder TO "C21437002";


--Ryan as PC technician can view, edit and insert into the cust_pc table to make new prebuilts
grant select on table cust_pc to "C21431604";
grant insert on table cust_pc to "C21431604";
grant update on table cust_pc to "C21431604";
GRANT USAGE ON SEQUENCE cust_pc_pc_id_seq TO "C21431604";
--  can see and choose what specs to go into each prebuilt
grant select on table cust_specs to "C21431604";
grant insert on table cust_specs to "C21431604";
grant update on table cust_specs to "C21431604";
-- can view and update components 
grant select on table cust_components to "C21431604";
grant update on table cust_components to "C21431604";
GRANT USAGE ON SEQUENCE cust_components_part_id_seq TO "C21431604";
-- can build new prebuilts
grant execute on function makePC to "C21431604"

--Paul as supplier acquisition
--can see all current suppliers and add to them
grant select on table cust_supplierdetails to "C21359216";
grant insert on table cust_supplierdetails to "C21359216";
grant usage on sequence cust_supplierdetails_supplier_id_seq to "C21359216";
-- can see what all suppliers supply to the business
grant select on table cust_supplycomponents to "C21359216";
grant insert on table cust_supplycomponents to "C21359216";
-- can see all components and add if new components come in
grant select on table cust_components to "C21359216";
grant insert on table cust_components to "C21359216";
grant usage on sequence cust_components_part_id_seq to "C21359216";
-- can use the addsupplier function and have access to the trigger logging table
GRANT EXECUTE ON FUNCTION addsupplierdetails TO "C21359216";
grant update on table supplier_log to "C21359216";
grant insert on table supplier_log to "C21359216";
grant select on table supplier_log to "C21359216";