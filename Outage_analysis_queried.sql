
--Identify the percentage of Outages for each priority level in Lagos

With is_priority as(
Select
	priority, 
	count(*) as total_priority
from outage_analysis
where city = 'Lagos'
group by 1
),
outages as(
	select count(*) as total_outage
from outage_analysis
	where city='Lagos'
)
Select 
	priority,
	total_priority,
	total_outage,
	round((total_priority*100/total_outage),2) as percentage
from is_priority
cross join outages

--Outcome:- 82% of cases are at low priority in Lagos

--Find the broadband type with the highest number of occurrences in each city
With Ranked as(
select
	city,
	bb_type,
	bb_name,
	sum(volume) as total_occurances,
	Row_number() over (partition by city order by sum(volume)desc) as rank
from outage_analysis
group by 1,2,3
)
Select 
	city,
	bb_type,
	bb_name,
	total_occurances,
	rank
from ranked
where rank = 1
--Outcome:- showcases the unique broadband type that has the highest occurrences in each city 

--Identify cities where "ADSL 1" has more than 50% of total outages marked as "Medium" priority.
With medium_tab as (select 
	city,
	bb_name,
	sum(case when priority='Medium'then volume else 0 end) as medium_volume,
	sum(volume) as total_volume
from outage_analysis
Group by 1,2
)
select 
	city,
	medium_volume,
	total_volume
from medium_tab
where bb_name ='ADSL 1' and Round((medium_volume *100/total_volume),2) >50


--Identify the Average Outage Duration by Region

Select 
	city,
	round(avg(outage_duration),2) as avg_outagetime
from outage_analysis
where outage_duration > 0
group by 1
order by 2 desc

--Outage Hotspots Linked to Hardware Type

select 
  bb_type, 
  bb_name,
  count(*) AS total_outages,
  sum(volume) AS total_frequency
from outage_analysis
group by 1,2
order by 3 DESC;

--Outcome:- The query showcases total outages for each broadband type ti identify it is linked to legacy or new technology 



--High-Priority Outages by Area Code.

select
	area_code,
	count(*) as critical_outages,
	sum(volume) as freaquency_outages
from outage_analysis
where priority in ('Critical','Severe')
group by 1
order by 2 desc
--Outcome:-showcases areas that have critical and severe outages 

--Recurring Outage Patterns

select
	log_report_type,
	count(*) as recurrence_count,
	sum(volume) as frequency_count
from outage_analysis
group by 1
having count(*) > 5
order by 2 desc
-- Outcome:-Flag regions with repeated outages for the same log_report_type (indicating unresolved issues

--Outage Duration vs. Broadband Type

select
	case 
	when bb_name in ('Fiber Ultra','Fiber Ultra Max','Fiber High Speed') then 'New Tech'
	when bb_name in ('ADSL 1','ADSl 2','ADSL 2+') then 'Legacy'
	else 'Other'
	end as hardware_category,
	round(avg(outage_duration),2) as avg_duration,
	count(*) as total_outages
from outage_analysis
group by 1
order by 2 desc

--Outcome:-Comparison between old and new tech 

