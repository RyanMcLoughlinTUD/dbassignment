-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-10-21 21:08:25 IST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g
--   edited:    Paul 
--   at:        2023-10-23 18:46:32 IST

--custpc table
CREATE TABLE custpc (
    custname       varchar(255) NOT NULL,
    custid         serial primary key,
    completestatus CHAR(1) NOT NULL,
    custaddress    varchar(255) NOT NULL,
    orderdate      DATE NOT NULL
);


--stock table
CREATE TABLE stock (
    stocktype         VARCHAR(255) NOT NULL,
    stockid           serial primary key,
    stockmanufacturer VARCHAR(255) NOT NULL,
    stockamount       int NOT NULL
);

--relies on stock
CREATE TABLE supplierdeliveries (
    supplierid      serial primary key,
    supplieraddress varchar(255) NOT NULL,
    supplierphone   varchar(10) NOT NULL,
    stock_stockid   int NOT NULL REFERENCES stock( stockid )
);

--relies on custpc and stock
CREATE TABLE pcspecs (
    custpc_custid int NOT NULL REFERENCES custpc( custid ),
    stock_stockid int NOT NULL REFERENCES stock( stockid ),
    noused        int NOT NULL
);

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
