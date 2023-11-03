--Function to be able to add a supplier to the cust_supplierdetails table, make a new supplier for the business
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
		rollback;
	end if;
	insert into cust_supplierdetails (supplier_name, supplier_address, supplier_phone) 
	values (f_suppliername, f_supplieraddress, f_supplierphone)
	returning supplier_id into v_supplier_id;
	return v_supplier_id;
	commit;
exception
when others then
	raise info 'Error name:%',sqlerrm;
	raise info 'Error state:%',sqlstate;
	rollback;
	return null;
end;
$$;

select addSupplierDetails('wappus.com', '1082 er 2, Cheepsn USA', '131-123-1253');
select * from cust_supplierdetails;
