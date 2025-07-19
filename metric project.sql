create database job_interviews;
use job_interviews;
select * from job_data;

-- turned off the sql safe updates to perform updates and deletion without using where clause
SET SQL_SAFE_UPDATES = 0;

-- set the date format to mm-dd-yy
UPDATE job_data
SET ds = STR_TO_DATE(ds, '%m/%d/%Y');

-- change the data type of ds from text to date
alter table job_data
modify column ds date;
#problem 1
select 
avg(t) as "average jobs reviewed per hour",
avg(p) as "average jobs reviewed per second"
from (
select ds, 
count(job_id)*3600/sum(time_spent) as t,
count(job_id)/sum(time_spent) as p
from job_data
group by ds)
as g;

#problem 2
select * from job_data;


select ds,
throughput,
avg(throughput)
over (
order by ds
rows between 6 preceding and current row)
as rolling_avg from (
select ds, count(event)/sum(time_spent) as throughput
from job_data
group by ds) as g;

#problem-3
select * from job_data;

select j.language,
(count(*)*100)/(t.total_count)
from job_data as j
cross join
(select count(*) as total_count
from job_data)
as t
group by j.language,t.total_count;

# problem-4

select * from job_data;

select * from job_data
where job_id IN (
select job_id from job_data
group by job_id
having count(*)>1)
or
actor_id in(
select actor_id from job_data
group by actor_id
having count(*) >1
);

create database metric;
use metric;
select * from users;
drop table email_events;
select * from users;

create table email_events(
user_id int,
occurred_at varchar(50),
action varchar(50),
user_type varchar(50)
);
create table events(
user_id int,
occurred_at varchar(50),
event_type	varchar(50),
event_name	varchar(50),
location	varchar(50),
device	varchar(50),
user_type int
);


show variables like "secure_file_priv";
use metric;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/table-2 events.csv'
into table events
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

SET SQL_SAFE_UPDATES = 0;

UPDATE email_events
SET occurred_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');

alter table email_events
modify column occurred_at datetime;


#problem-1

select * from events
order by user_id asc;
select * from users;
SELECT
  DATE_FORMAT(occurred_at, '%Y-%u') AS year_and_week,
  count(distinct(user_id)) as active_users
  from events
  group by year_and_week
  order by year_and_week
  ;
  
#PROBLEM-2
select * from events;
select year_and_week,new_users,
sum(new_users) over(order by year_and_week) as joined_users from(
select  DATE_FORMAT(occurred_at, '%Y-%u') AS year_and_week,
count(distinct(user_id)) as new_users from events
where event_name = "complete_signup"
group by year_and_week
order by year_and_week
) as weekly;
select distinct(event_name) from events;

#PROBLEM-3
select * from events;

with signups as (
select user_id,event_type,DATE_FORMAT(occurred_at, '%Y-%u') AS week from events 
where event_type = "signup_flow"
group by user_id,week), activity as (
select user_id,event_type,DATE_FORMAT(occurred_at, '%Y-%u') AS week from events 
where event_type = "engagement"
group by user_id,week
)
select s.user_id, TIMESTAMPDIFF(WEEK, STR_TO_DATE(concat(s.week,"-1"), '%X-%V-%w'),
STR_TO_DATE(concat(a.week,"-1") ,'%X-%V-%w')) AS weeks_after_signup
from signups as s
join activity as a
on s.user_id = a.user_id;

#PROBLEM-4

select * from events;
select date_format(occurred_at,"%Y-%u") as weeks,device from events
group by weeks,device
order by weeks;

#PROBLEM-5
select * from email_events;
select user_id, action, count(action) as actions 
from email_events
group by user_id,action
order by user_id;
select distinct(action) from email_events;
select user_id,
sum(case when action = "sent_weekly_digest" then 1 else 0 end) as sent,
sum(case when action = "sent_reengagement_email" then 1 else 0 end) as reengagement_email,
sum(case when action = "email_clickthrough" then 1 else 0 end) as clicked,
sum(case when action = "email_open" then 1 else 0 end) as opened
from email_events
group by user_id
order by user_id
;