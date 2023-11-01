drop table supplier_log;

create table supplier_log(
	supplierid int,
	suppliername varchar(100),
	supplieraddress varchar(80),
	username varchar(80),
	changedate date);

create or replace function addSupplierDetails(
	f_suppliername cust_supplierdetails.supplier_name%type,
	f_supplieraddress cust_supplierdetails.supplier_address%type,
	f_supplierphone cust_supplierdetails.supplier_phone%type)
	returns integer
	language plpgsql
as $$
declare
	v_supplier_id integer;
	v_phone_check integer;
begin
	select count(*) into v_phone_check from cust_supplierdetails where supplier_phone = f_supplierphone;
	if v_phone_check > 0 then
		raise exception 'This phone number is already linked to another business';
	end if;
	insert into cust_supplierdetails (supplier_name, supplier_address, supplier_phone) 
	values (f_suppliername, f_supplieraddress, f_supplierphone)
	returning supplier_id into v_supplier_id;
	return v_supplier_id;
exception
when others then
	raise info 'Error name:%',sqlerrm;
	raise info 'Error state:%',sqlstate;
	return null;
end;
$$;

select addSupplierDetails('Wingus.com', '108 The Bog, Bogtown USA', '088-202-1010');

select * from supplier_log;
select * from cust_supplierdetails;

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

CREATE or replace TRIGGER supplier_log BEFORE INSERT OR UPDATE ON cust_supplierdetails 
FOR EACH ROW EXECUTE FUNCTION supplier_log();
