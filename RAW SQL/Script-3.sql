set search_path to "Cust857B";

select * from cust_supplierdetails;
select * from cust_components;

insert into cust_supplierdetails(supplier_address, supplier_phone, supplier_name) values('test' ,'087-11-11','test');
insert into cust_components (part_name, part_manufacturer, part_stock) values ('test', 'test', 0);