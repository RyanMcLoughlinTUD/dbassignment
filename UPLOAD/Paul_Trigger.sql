drop table supplier_log;
--Create the logging table for the function
create table supplier_log(
	supplierid int,
	suppliername varchar(100),
	supplieraddress varchar(80),
	username varchar(80),
	changedate date);

--make the function to insert data onto the logging table
create or replace function supplier_log() returns trigger AS $supplier_log$
declare 
	uname varchar(80);
	cdate date;
begin
	select user into uname;
	select now() into cdate;	
	insert into supplier_log values(new.supplier_id, new.supplier_name, new.supplier_address, uname, cdate);
	return new;
end;
$supplier_log$ language plpgsql;

--Whenever insert onto cust_supplierdetails, run the logging function
CREATE or replace TRIGGER supplier_log BEFORE INSERT OR UPDATE ON cust_supplierdetails 
FOR EACH ROW EXECUTE FUNCTION supplier_log();