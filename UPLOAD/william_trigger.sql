set search_path to "Cust857B";
drop table order_log;

create TABLE order_log (
    log_id serial PRIMARY KEY,
    function_name VARCHAR(100),
    function_triggered date,
	users VARCHAR(100)
);

CREATE OR REPLACE FUNCTION logOrders() RETURNS TRIGGER AS $log_orders$
declare 
	function_name varchar(80);
BEGIN
    INSERT INTO order_log (function_name, function_triggered, users)
    VALUES (function_name, now(), current_user);
    RETURN NEW;
END;
$log_orders$ LANGUAGE plpgsql;

CREATE TRIGGER log_addOrder_call
    AFTER INSERT OR UPDATE
    ON cust_order
    FOR EACH STATEMENT
    EXECUTE FUNCTION logOrders('addOrder');
    
   select addOrder('c21359216@mytudublin.ie', 'Gaming Beast');
   
  select * from order_log
