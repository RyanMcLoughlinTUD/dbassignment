select * from suplierdetails;

create table supplier_log(
	supplierid int,
	supplieraddress varchar(80),
	suppliername varchar(100),
	username varchar(80),
	changedate date);

create or replace function addSupplierDetails(
	f_suppliername supplierdetails.suppliername%type,
	f_supplieraddress supplierdetails.supplieraddress%type,
	f_supplierphone supplierdetails.supplierphone%type)
	returns integer
	language plpgsql
as $$
declare
	v_supplier_id integer;
	v_phone_check integer;
begin
	select count(*) into v_phone_check from supplierdetails where supplierphone = f_supplierphone;
	if v_phone_check > 0 then
		raise exception 'This phone number is already linked to another business';
	end if;
	insert into supplierdetails (suppliername, supplieraddress, supplierphone) 
	values (f_suppliername, f_supplieraddress, f_supplierphone)
	returning supplierid into v_supplier_id;
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

create or replace function supplier_log() returns trigger AS $supplier_log$
declare 
	uname varchar(80);
	cdate date;
begin
	select user into uname;
	select now() into cdate;	
	insert into supplier_log values(new.supplierid, new.suppliername, new.supplieraddress, uname, cdate);
	return new;
end;
$supplier_log$ language plpgsql;

CREATE or replace TRIGGER supplier_log BEFORE INSERT OR UPDATE ON supplierdetails 
FOR EACH ROW EXECUTE FUNCTION supplier_log();