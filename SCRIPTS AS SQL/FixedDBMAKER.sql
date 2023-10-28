-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-10-27 15:12:32 IST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

drop table partsdefect;
drop table partsreturn;
drop table pcspecs;
drop table stock;
drop table custpc;
drop table persondetails;
drop table supplierdeliveries;

CREATE TABLE persondetails (
    personid      SERIAL primary key,
    personname    VARCHAR(100) NOT NULL,
    personaddress VARCHAR(255) NOT NULL,
    personemail   VARCHAR(100) NOT NULL,
    personphone   VARCHAR(20) NOT NULL
);

CREATE TABLE custpc (
    custid         INTEGER primary key,
    custname       VARCHAR(255) NOT NULL,
    completestatus CHAR(1) NOT NULL,
    custaddress    VARCHAR(255) NOT NULL,
    orderdate      DATE NOT NULL,
    personid       INTEGER references persondetails(personid)
);

CREATE TABLE supplierdeliveries (
    supplierid      SERIAL primary key,
    supplieraddress VARCHAR(255) NOT NULL,
    supplierphone   VARCHAR(20) NOT NULL
);

CREATE TABLE partsreturn (
    stockid         SERIAL primary key,
    stocktype       VARCHAR(100) NOT NULL,
    supplieraddress VARCHAR(255) NOT NULL,
    supplierid      INTEGER references supplierdeliveries(supplierid),
    partsreturn_id  SERIAL NOT NULL
);

CREATE TABLE stock (
    stockid           SERIAL primary key,
    stocktype         varchar(255) NOT NULL,
    stockmanufacturer varchar(255) NOT NULL,
    stockamount       INTEGER NOT NULL,
    supplierid        SERIAL references supplierdeliveries(supplierid)
);

CREATE TABLE partsdefect (
    pcid           SERIAL NOT NULL,
    stocktype      VARCHAR(100) NOT NULL,
    stockid        INTEGER NOT NULL,
    partsreturn_id integer references partsreturn(stockid)
);

CREATE TABLE pcspecs (
    custid integer references persondetails(personid),
    stockid integer references stock(stockid),
    numused  INTEGER NOT NULL
);


