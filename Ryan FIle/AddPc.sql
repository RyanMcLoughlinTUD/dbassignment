create or replace function makePC(PC_NAME cust_pc.pc_name%type)
    language plpgsql
as $$
declare
begin
    update cust_components
    if part_stock = 0 then
        raise exception 'We have not enough stock to make this pc'
    end if
    set part_stock = part_stock -1
    where part_id in(
        select pc_name, part_name from cust_pc
        join cust_specs using(pc_id)
        join cust_components using(part_id)
        where pc_name = PC_NAME
    );
end;
$$;