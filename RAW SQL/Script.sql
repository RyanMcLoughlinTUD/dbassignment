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
    order_email VARCHAR(100) NOT NULL
);  

CREATE TABLE cust_specs (
    pc_id   INTEGER references cust_pc(pc_id),
    part_id INTEGER references cust_components(part_id)
);   

CREATE TABLE cust_supplycomponents (
    part_id       integer references cust_components(part_id),
    supplier_id   integer references cust_supplierDetails(supplier_id),
    supplied_date DATE not NULL
);