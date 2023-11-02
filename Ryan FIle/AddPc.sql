create or replace function makePC(pcNAME cust_pc.pc_name%type)
	returns VOID
    language plpgsql
as $$
begin
	if exists(
		select 1
		from cust_pc as cpc
		join cust_specs as cs on cpc.pc_id = cs.pc_id 
		join cust_components as cc on cs.part_id = cc.part_id 
		where cpc.pc_name = pcNAME and cc.part_stock = 0
	)then 
		raise exception 'We do not have the stock required to make this PC';
	end if;
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

drop function makePC;

select * from cust_components cc ;

create table PCMadeList(
	PcBuilt varchar(100)
);

select makePC('Gaming Beast');

drop table pcmadelog;

create table pcmadelog(
	PCmade varchar(100),
	MadeDate DATE,
	username varchar(100)
	);

drop function pc_made_log;

create or replace function pc_made_log() 
returns trigger as $pcmadelog$
declare 
	v_pcname varchar(100);
begin
	select pcbuilt from pcmadelist 
	order by ctid desc
	limit 1
	into v_pcname;
	insert into pcmadelog(PCmade, MadeDate, username) values(v_pcname, NOW(), current_user);
	return new;
end;
$pcmadelog$ language plpgsql;


create or replace trigger pcmadelog before insert or update on pcmadelist
for each row execute function pc_made_log();

drop trigger pcmadelog on pcmadelist;

select * from pcmadelog;
select * from cust_supplierdetails cs ;
select * from pcmadelist;