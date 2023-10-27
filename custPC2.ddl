-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-10-27 15:12:32 IST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g


CREATE TABLE custpc (
    custid         INTEGER primary key,
    custname       VARCHAR2(255) NOT NULL,
    completestatus CHAR(1) NOT NULL,
    custaddress    VARCHAR2(255) NOT NULL,
    orderdate      DATE NOT NULL,
    personid       INTEGER persondetails(personid)
);

CREATE TABLE supplierdeliveries (
    supplierid      INTEGER primary key,
    supplieraddress VARCHAR2(255) NOT NULL,
    supplierphone   VARCHAR2(10) NOT NULL
);

CREATE TABLE partsdefect (
    pcid           INTEGER NOT NULL,
    stocktype      VARCHAR2(100) NOT NULL,
    stockid        INTEGER NOT NULL,
    partsreturn_id integer references partsreturn(stockid)
);

CREATE TABLE partsreturn (
    stockid         INTEGER primary key,
    stocktype       VARCHAR2(100) NOT NULL,
    supplieraddress VARCHAR2(255) NOT NULL,
    supplierid      INTEGER references supplierdeliveries(supplierid),
    partsreturn_id  NUMBER NOT NULL
);

CREATE TABLE pcspecs (
    custid  INTEGER primary key,
    stockid INTEGER references stock(stockid),
    numused  INTEGER NOT NULL
);

CREATE TABLE persondetails (
    personid      INTEGER primary key,
    personname    VARCHAR2(100) NOT NULL,
    personaddress VARCHAR2(255) NOT NULL,
    personemail   VARCHAR2(100) NOT NULL,
    personphone   INTEGER NOT NULL
);

CREATE TABLE stock (
    stockid           INTEGER primary key,
    stocktype         varchar(255) NOT NULL,
    stockmanufacturer varchar(255) NOT NULL,
    stockamount       INTEGER NOT NULL,
    supplierid        INTEGER references supplierdeliveries(supplierid)
);