set search_path to "Cust857B";
select * from cust_buyer;
select * from cust_order;
select * from cust_pc;

insert into cust_buyer (buyer_name, buyer_address, buyer_email)
values ('William', 'Lissadell, Piedmont, Riverstown, Dundalk, Co.Louth', 'C21437002@mytudublin.ie,');

insert into cust_order (pc_id, buyer_id, order_date, order_email)
values (1, 1, '01/11/2023', 'c21437002@mytudublin.ie');
