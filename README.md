# netflix_sql_project
Analyze Netflix dataset from Kaggle using SQL to answer 15 business questions, including content distribution by type, country, and genre, top actors and directors, Indian content trends, TV shows with multiple seasons, and content classification based on keywords.

This project performs an in-depth analysis of the Netflix dataset (sourced from Kaggle) using SQL to extract meaningful business insights. The dataset contains detailed information about Netflix content, including movies and TV shows, directors, casts, countries, release years, ratings, genres, duration, and descriptions.

The analysis demonstrates practical SQL techniques such as aggregation, string manipulation, array handling, filtering, and window functions, providing a comprehensive understanding of Netflix content trends.

Dataset Schema
show_id -	Unique ID for each title
type - Movie or TV Show
title	- Name of the content
director	- Director(s) of the content
casts -	Cast members
country -	Country or countries of production
date_added -	Date the content was added to Netflix
release_year	- Year of release
rating	- Content rating
duration	- Duration in minutes (for movies) or seasons (for TV shows)
listed_in	- Genre(s)
description	- Brief content description

Key Business Questions Addressed
1.Movies vs TV Shows – Count of each type.
2.Most Common Ratings – Top ratings for movies and TV shows.
3.Movies Released in a Specific Year – Example: 2020.
4.Top Countries with Most Content – Shows production distribution by country.
5.Longest Movie – Identify movies with the maximum duration.
6.Recent Additions – Content added in the last 5 years.
7.Content by Specific Director – Example: Rajiv Chilaka.
8.TV Shows with More Than 5 Seasons – Identify long-running shows.
9.Content Count by Genre – Number of items per genre.
10.India’s Contribution – Year-wise content releases by India and their percentage share.
11.Documentaries – List all movies categorized as documentaries.
12.Content Without a Director – Identify missing data in the director field.
13.Actor Analysis – Number of movies featuring “Salman Khan” in the last 10 years.
14.Top Actors in Indian Movies – Actors with the most appearances in Indian content.
15.Content Classification – Label content as “Good” or “Bad” based on keywords like “kill” and “violence” in descriptions.

Technologies Used
PostgreSQL – For data storage, querying, and analysis
SQL Queries – For filtering, aggregation, string operations, array handling, and window functions

Insights & Highlights
Identify content trends across years, countries, and genres.
Highlight popular actors and directors in Indian and international content.
Detect long-running TV shows with multiple seasons.
Classify content into good or potentially violent for business and research purposes.
Gain a deeper understanding of Netflix’s content strategy and distribution patterns.

How to Use
Import the netflix.csv dataset into a PostgreSQL database.
Create the netflix table using the provided schema.
Run the SQL queries for each business question to get insights.
Modify queries to explore additional insights or filter by other criteria like year, country, or actor.

Conclusion
This project demonstrates how real-world business questions can be answered using SQL on streaming platform datasets. It’s a practical example of data analysis for decision-making in the entertainment industry, helping analysts, business strategists, and data enthusiasts gain actionable insights from content metadata.
