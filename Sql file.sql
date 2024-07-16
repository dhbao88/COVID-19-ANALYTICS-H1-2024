use covid;
rename table covid_19 to covid;
select * from covid;
alter table covid
modify column cases int;

alter table covid
modify column recovered int;

update covid
set deaths = '0'
where deaths like '';

alter table covid
modify column deaths int;

update covid
set tests = '0'
where tests like '';

alter table covid
modify column tests int;

set sql_safe_updates =0;
set autocommit=off;
delete from covid
where continent like '' or population like '';

#Dieu chinh cot time
select * from covid;
update covid
set time =substring_index(time,"+",1); 

update covid
set time=str_to_date(concat(substring_index(time,"T",1),substring_index(time,"T",-1)), "%Y-%m-%d %H:%i:%s");

commit;
create table country 
as select country, population,continent from covid;

create table cases 
as select country,time,cases, recovered, deaths,tests  from covid;

select * from country;
select * from cases;
