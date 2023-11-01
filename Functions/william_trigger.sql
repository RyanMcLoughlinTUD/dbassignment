CREATE OR REPLACE FUNCTION logOrders(function_name text) RETURNS TRIGGER AS $log_orders$
BEGIN
    SELECT current_user INTO current_user_name;
    INSERT INTO order_log (function_name, function_triggered, user_name)
    VALUES (function_name, NOW(), current_user);
    RETURN NEW;
END;
$log_orders$ LANGUAGE plpgsql;

CREATE TRIGGER log_addOrder_call
    AFTER INSERT OR UPDATE
    ON your_orders_table
    FOR EACH STATEMENT
    EXECUTE FUNCTION logOrders('addOrder');