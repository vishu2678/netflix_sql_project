drop table if exists netflix;
create table netflix(
    show_id varchar(20),
    type varchar(10),
    title varchar(105),
    director varchar(210),
    casts varchar(800),
    country varchar(125),
	date_added varchar(20),
	release_year int,
	rating varchar(10),
	duration varchar(15),
	listed_in varchar(80),
	description varchar(250)
)

select * from netflix;
--15 business questions

--1.Count the number of movies vs tv shows
select type,count(*) as total_count
from netflix
group by type;

--2.Find the most common ratings for movies and  tv shows
select type,
       rating
from	   
(select type,
       rating,
	   count(rating),
	   rank() over(partition by type order by count(rating) desc) as ranking
from netflix
group by type,rating
) as t1
where ranking=1;

--3.List all the movies released in a specific year(eg.2020)
select title from netflix
where type='Movie' and release_year=2020;

--4.Find the top 5 countries with most content
select new_country
from
(select unnest(string_to_array(country,', ')) as new_country 
from netflix)
group by new_country
order by count(*) desc
limit 5;

--5.Identify the longest Movie
select title from netflix
where duration=(select max(duration) from netflix);

--6.Find the content added in the last 5 years
select * from netflix
where to_date(date_added,'Month DD,YYYY')>=current_date - interval '5 years';

--7.Find all the movies/tv shows directed by 'Rajiv Chilaka'
select title
from
(select *,unnest(string_to_array(director,', ')) as new_director from netflix)
where new_director='Rajiv Chilaka';
--another way
select title from netflix
where director ilike '%Rajiv Chilaka%';
--(like checks for exact same but ilike matches when case is diff(rajiv chilaka)is also fine)

--8.List all the Tv shows with more than 5 seasons
select title,duration from netflix
where type='TV Show' and (split_part(duration,' ',1))::numeric>5 ;

--9.Count the number of content items in each genre
select unnest(string_to_array(listed_in,', ')) as genre 
       ,count(*) 
from netflix
group by genre;

--10.Find each year and average number of content release by india on netflix
-- & return top 5 year with highest avg content release
SELECT 
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS release_year,
    COUNT(*) AS total_titles,
    round((COUNT(*) * 100.0 / 
       (SELECT COUNT(*) 
        FROM (
            SELECT unnest(string_to_array(country, ', ')) AS new_country
            FROM netflix
        ) t
        WHERE new_country = 'India')
    ),2) AS percentage_share
FROM (
    SELECT *, unnest(string_to_array(country, ', ')) AS new_country
    FROM netflix
) n
WHERE new_country = 'India'
GROUP BY 1
order by percentage_share desc
limit 5;

--11.list all the movies that are documentaries
select * from netflix
where type='Movie' and listed_in ilike '%Documentaries%';

--12.Find all content without a director
select * from netflix
where director is null;

--13.Find how many movies actor 'salman khan' appeared in last 10 years.
select * from netflix
where casts ilike '%salman khan%'
  and release_year>= extract(year from current_date)-10;

--14.Find the top 10 actors who appeared in the highest number of movies produced in India.
select unnest(string_to_array(casts,', ')) as actors,count(*) from netflix
where country like '%India%'
group by 1
order by 2 desc
limit 10;

--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field.
--Label content containing these keywords as 'Bad' and all other content as 'Good'.
--Count how many items fall into each category.
select 
     count(*),
	 case 
	 when description like '%kill%' or
	      description like '%violence%' then 'bad'
	 else 'good'	
	 end category	 
from netflix
group by category;
