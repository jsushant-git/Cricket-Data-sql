CREATE DATABASE my_project;

USE my_project;

SELECT * FROM cricket_data1 limit 3;

UPDATE cricket_data1
SET start_date = STR_TO_DATE(start_date,'%d-%m-%Y');

UPDATE cricket_data1
SET end_date = STR_TO_DATE(end_date,'%d-%m-%Y');

UPDATE cricket_data1
SET end_date = left(end_date,10);

ALTER TABLE cricket_data1 
MODIFY end_date DATE;

-- ###############DATA CLEANING DONE##########################

-- Q1) TOTAL MATCHES PLAYED

SELECT COUNT(*) AS total_matches
FROM cricket_data1;


-- Q2) How many matches each season
SELECT season, COUNT(*) AS total_matches_seasons
FROM cricket_data1
GROUP BY season
order by season;

-- Q3) Team to win most number of matches

SELECT winner, COUNT(*) AS wins
FROM cricket_data1
GROUP BY winner
order by wins DESC 
LIMIT 1;

-- Q4) Top 5 winning teams

select winner, count(*) as winss
from cricket_data1
group by winner
order by winss DESC
limit 5;


-- Q5)how many times won the toss and won the match

select count(*) as toss_and_matchwin
from cricket_data1
where toss_won = winner;

-- q6) Batting vs Bowling after winning the toss

select decision, count(*) as total_wins
from cricket_data1
group by decision;

-- q7) Highest score in 1st inning

select max(first_inning_score) as Highest_score_1stInning
from cricket_data1;

-- Q8 lowest score in 1st inning
select min(first_inning_score) as Lowest_score_1stInning
from cricket_data1;

-- Q9 Highest Run chase(2nd inning)

select max(second_inning_score) as Highest_chase_2ndInning
from cricket_data1;

-- Q10 most "Player of the match" winner

select pom, count(*) as awards
from cricket_data1
group by pom
order by awards DESC
limit 1;

-- Q11 Top 5 WITH "POM" awards
select pom, count(*) as awards
from cricket_data1
group by pom
order by awards DESC
limit 5;

-- Q12 Home team vs Away team performance

select home_team, count(*) home_matches
from cricket_data1
group by home_team;


-- Q13 venue to host morst matches

select venue_name, count(*) as matches_hosted
from cricket_data1
group by venue_name
order by matches_hosted DESC
limit 1;

-- Q14 matches where team won by chasing 

select count(*) as chasing_wins
from cricket_data1
where second_inning_score > first_inning_score;


-- Q15 matches where team defended score

select count(*) as defended_wins
from cricket_data1
where second_inning_score > first_inning_score;

-- Q16 Avg score per match

select avg(first_inning_score) as avg_first,
        avg(second_inning_score) as avg_second
        from cricket_data1;



-- Q17 close matches (difference 10 runs or less)

select * from cricket_data1
where abs(first_inning_score-second_inning_score) < 10
limit 10;

-- Q18 Team wise wins percentage
select winner, count(*)*100.0/(select count(*) from cricket_data1) as win_percentage
			from cricket_data1
            group by winner
            order BY win_percentage DESC;
