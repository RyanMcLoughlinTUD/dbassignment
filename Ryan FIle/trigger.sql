create table PCMadeList(
	PcBuilt varchar(100)
);

create table pcmadelog(
	PCmade varchar(100),
	MadeDate DATE,
	username varchar(100)
);

create or replace function pc_made_log() 
returns trigger as $pcmadelog$
declare 
	v_pcname varchar(100);
begin
--select the most recent pc built, and add to pc made log
	select pcbuilt from pcmadelist 
	order by ctid desc
	limit 1
	into v_pcname;
	insert into pcmadelog(PCmade, MadeDate, username) values(v_pcname, NOW(), current_user);
	return new;
end;
$pcmadelog$ language plpgsql;

--trigger occurs each time an item is added to pcmadelist
create or replace trigger pcmadelog before insert or update on pcmadelist
for each row execute function pc_made_log();