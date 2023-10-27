--STOCK

--Processors
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Ryzen 7 5800X','AMD', 10, 1);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Ryzen 7 5700G','AMD', 10,1);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Ryzen 5 5600X','AMD', 10,1);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Ryzen 7 4500G','AMD', 10,1);
--GPUS
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('EVGA RTX4090Ti','EVGA', 10,2);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('EVGA RTX4080Ti','EVGA', 10,2);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('EVGA RTX4070Ti','EVGA', 10,2);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('EVGA RTX3070','EVGA', 10,2);
--RAM
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Vengeance 32gb DDR4 3600mhz kit','CORSAIR', 10,3);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Vengeance 16gb DDR4 3600mhz kit','CORSAIR', 10,3);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Vengeance 16gb DDR4 3200mhz kit','CORSAIR', 10,3);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Vengeance 32gb DDR4 3200mhz kit','CORSAIR', 10,3);
--PSUs
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Focus GX 750 Watt PSU','SEASONIC', 10,4);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Focus GX 850 Watt PSU','SEASONIC', 10,4);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Focus GX 1000 Watt PSU','SEASONIC', 10,4);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Focus GX 1250 Watt PSU','SEASONIC', 10,4);
--MEMORY
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('P5 NVME SSD 1Tb','CRUCIAL', 10,5);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('980 Pro NVME SSD 1Tb','SAMSUNG', 10,6);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('970 Pro NVME SSD 1Tb','SAMSUNG', 10,6);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('P3 NVME SSD 1Tb','CRUCIAL', 10,5);
--CASES
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Meshify C Black','FRACTAL', 10,7);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Define C Black','FRACTAL', 10,7);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('NZXT Case White','NZXT', 10,8);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('NZXT Case Black','NZXT', 10,8);
--Cooling
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('NHD15 Black Chromax','NOCTUA', 10,9);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('NH15 Black Chromax','NOCTUA', 10,9);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('NH15 Standard','NOCTUA', 10,9);
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('NHD15 Standard','NOCTUA', 10,9);
--EXTRA FANS
insert into stock(stocktype, stockmanufacturer, stockamount , supplierid) values ('Noctua fans 2 pack','NOCTUA', 10,9);

--SUPPLIERS
-- Inserting fake data into the supplierdeliveries table
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('123 Main Street, Fakeville', '555-123-4567');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('456 Elm Street, Faketown', '555-987-6543');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('789 Oak Avenue, Imaginary City', '555-456-7890');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('321 Pine Road, Dreamland', '555-876-5432');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('555 Cedar Lane, Fictionville', '555-234-5678');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('777 Willow Drive, Makebelieve Town', '555-765-4321');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('999 Birch Court, Fantasy City', '555-345-6789');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('1234 Redwood Street, Wonderland', '555-654-3210');
INSERT INTO supplierdeliveries (supplieraddress, supplierphone) VALUES ('5678 Sequoia Avenue, Enchanted Forest', '555-432-1098');

--CUSTOMERS
-- Inserting fake personal details into the personaldetails table
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('John Doe', '123 Main Street, Anytown, USA', 'johndoe@example.com', '555-123-4567');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Jane Smith', '456 Elm Avenue, Somecity, USA', 'janesmith@example.com', '555-987-6543');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('David Johnson', '789 Oak Lane, Anotherplace, USA', 'davidjohnson@example.com', '555-456-7890');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Sarah Brown', '321 Maple Street, Imaginarytown, USA', 'sarahbrown@example.com', '555-876-5432');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Michael Lee', '555 Pine Road, Dreamcity, USA', 'michaellee@example.com', '555-234-5678');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Jennifer Taylor', '777 Oak Street, Dreamland, USA', 'jennifertaylor@example.com', '555-765-4321');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Robert Davis', '999 Willow Lane, Makebelieveville, USA', 'robertdavis@example.com', '555-345-6789');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Lisa White', '1234 Birch Road, Fantasyville, USA', 'lisawhite@example.com', '555-654-3210');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('James Harris', '5678 Cedar Avenue, Wonderland, USA', 'jamesharris@example.com', '555-432-1098');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Karen Allen', '123 Maple Lane, Enchanted Forest, USA', 'karenallen@example.com', '555-987-6543');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('William Turner', '456 Elm Road, Mythical City, USA', 'williamturner@example.com', '555-456-7890');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Amanda Parker', '789 Oak Avenue, Fairyland, USA', 'amandaparker@example.com', '555-234-5678');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Daniel Hall', '321 Pine Lane, Magic Town, USA', 'danielhall@example.com', '555-765-4321');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Elizabeth Wilson', '555 Willow Street, Wonderland, USA', 'elizabethwilson@example.com', '555-345-6789');
INSERT INTO personaldetails (personname, personaddress, personemail, personphone)VALUES ('Christopher Clark', '777 Birch Road, Whimsicalville, USA', 'christopherclark@example.com', '555-654-3210');

--populating build table
-- PC 1 (Customer 1)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 1, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 7 5800X'
   OR stocktype = 'EVGA RTX4090Ti'
   OR stocktype = 'Vengeance 32gb DDR4 3600mhz kit'
   OR stocktype = 'Focus GX 750 Watt PSU'
   OR stocktype = 'Meshify C Black'
   OR stocktype = 'NHD15 Black Chromax';

-- PC 2 (Customer 2)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 2, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 7 5700G'
   OR stocktype = 'EVGA RTX4080Ti'
   OR stocktype = 'Vengeance 16gb DDR4 3600mhz kit'
   OR stocktype = 'Focus GX 850 Watt PSU'
   OR stocktype = 'Define C Black'
   OR stocktype = 'NH15 Black Chromax';

-- PC 3 (Customer 3)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 3, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 5 5600X'
   OR stocktype = 'EVGA RTX4070Ti'
   OR stocktype = 'Vengeance 16gb DDR4 3200mhz kit'
   OR stocktype = 'Focus GX 1000 Watt PSU'
   OR stocktype = 'NZXT Case White'
   OR stocktype = 'NH15 Standard';

-- PC 4 (Customer 4)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 4, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 7 4500G'
   OR stocktype = 'EVGA RTX3070'
   OR stocktype = 'Vengeance 32gb DDR4 3200mhz kit'
   OR stocktype = 'Focus GX 1250 Watt PSU'
   OR stocktype = 'NZXT Case Black'
   OR stocktype = 'NHD15 Standard';

-- PC 5 (Customer 5)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 5, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 7 5800X'
   OR stocktype = 'EVGA RTX4090Ti'
   OR stocktype = 'Vengeance 32gb DDR4 3600mhz kit'
   OR stocktype = 'Focus GX 750 Watt PSU'
   OR stocktype = 'Meshify C Black'
   OR stocktype = 'NHD15 Black Chromax';

-- PC 6 (Customer 6)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 6, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 7 5700G'
   OR stocktype = 'EVGA RTX4080Ti'
   OR stocktype = 'Vengeance 16gb DDR4 3600mhz kit'
   OR stocktype = 'Focus GX 850 Watt PSU'
   OR stocktype = 'Define C Black'
   OR stocktype = 'NH15 Black Chromax';

-- PC 7 (Customer 7)
INSERT INTO pcspecs (custid, stockid, numused)
SELECT 7, stockid, 1
FROM stock
WHERE stocktype = 'Ryzen 5 5600X'
   OR stocktype = 'EVGA RTX4070Ti'
   OR stocktype = 'Vengeance 16gb DDR4 3200mhz kit'
   OR stocktype = 'Focus GX 1000 Watt PSU'
   OR stocktype = 'NZXT Case White'
   OR stocktype = 'NH15 Standard';


