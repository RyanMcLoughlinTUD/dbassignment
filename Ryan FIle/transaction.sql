create or replace function makePC(pcNAME cust_pc.pc_name%type)
	returns VOID
    language plpgsql
as $$
begin
--check stock levels, if theres an issue, raise an error
	if exists(
		select 1
		from cust_pc as cpc
		join cust_specs as cs on cpc.pc_id = cs.pc_id 
		join cust_components as cc on cs.part_id = cc.part_id 
		where cpc.pc_name = pcNAME and cc.part_stock = 0
	)then 
		raise exception 'We do not have the stock required to make this PC';
	end if;
--if there is stock, build a pc, and --1 from each stock item used
	insert into PCMadeList(PcBuilt) values(pcNAME);
    update cust_components as cc
    set part_stock = part_stock -1
    where cc.part_id in(
        select cc.part_id from cust_pc as cpc
        join cust_specs as cs on cpc.pc_id = cs.pc_id
        where cpc.pc_name = pcNAME  
    );
   
end;
$$;

select makePC('Gaming Beast');