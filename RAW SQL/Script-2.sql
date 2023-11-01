create or replace function addOrder(
buyer_email_f varchar(100),
pc_name_f varchar(100)
)
returns void
language plpgsql
as $$
declare
pc_id_f integer;
buyer_id_f integer;
begin
	select buyer_id into buyer_id_f from cust_buyer where buyer_email_f = buyer_email;
	if not found then
		raise exception 'The email % does not exist', buyer_email_f;
	end if;
	select pc_id into pc_id_f from cust_pc where pc_name_f = pc_name;
	if not found then
		raise exception 'The pc % does not exist', pc_name_f;
	end if;

	insert into cust_order (pc_id, buyer_id, order_date, order_email)
	values (pc_id_f, buyer_id_f, now(), buyer_email_f);
end;
$$

select addOrder('C21359216@mytudublin.ie,', 'Gaming Beast');
select * from cust_order co 