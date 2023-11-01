set search_path to "Cust857B";

CREATE TABLE order_log (
    log_id serial PRIMARY KEY,
    function_name VARCHAR(100),
    function_triggered timestamp,
	users VARCHAR(100)
);

create or replace function addOrder(
buyer_email_f varchar(100),
pc_name_f varchar(100)
)
RETURNS TRIGGER AS $log_orders$
returns new
language plpgsql
as $$
declare
pc_id_f integer;
buyer_id_f integer;
begin

	INSERT INTO order_log (function_name, function_triggered, users)
    VALUES ("addOrder", NOW(), current_user);

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
$log_orders$

CREATE TRIGGER order_logs
    AFTER INSERT OR UPDATE
    ON pc_order
    FOR EACH STATEMENT
    EXECUTE FUNCTION addOrder();
