PostgreSQL data analysis project to provide valuable insights and benefits for various stakeholders. Such as
Understanding audience preferences
Evaluate the financial success of movies
Identify common elements in successful movies
To build recommendation engines that suggest relevant films to users
To study broader trends in the film industry

--Total number of movies in table
Select count(movie) as total_movies
from imdb_top_1000
where movie is not null

--List all movies released in the year 2020.
Select 
	movie,
	release_year
from imdb_top_1000
Where release_year = 2020
group by 1,2

--Find the top 10 highest-grossing movies of all time.
Select 
	movie,
	release_year,
	max(gross_revenue) as highest_revenue
from imdb_top_1000
Where gross_revenue is not null
Group by 1,2
order by 3 desc
Limit 10

--Retrieve the names of actors who have starred in more than 7 movies.
select 
	star_actor,
	count(movie) as num_movies
from imdb_top_1000
Group by 1
Having count(movie) > 7
order by 2 desc

--List the directors who have directed at least three movies.
Select
	director,
	count(movie) as num_movies
from imdb_top_1000
Group by 1
Having count(movie) >= 3
order by 2 desc

--What is the average rating of all movies in the database?
Select 
	avg(imdb_rating) as avg_rating
from imdb_top_1000

--List all movies with 'A' certificate.
Select 
	movie,
	release_year,
	certificate
from imdb_top_1000
Where certificate = 'A'
order by 2

--Retrieve the titles of movies that belong to the 'Drama' & 'Crime' genre.
Select 
	movie,
	genre
from imdb_top_1000
Where genre in ('Crime, Drama')

--List the movies where actor 'Tom Hanks' has appeared alongside their release year.
Select 
	movie,
	star_actor,
	release_year
from imdb_top_1000
Where star_actor = 'Tom Hanks'
order by 3 

--Find the movie with the longest duration (runtime) in minuets.
Select
	movie,
	release_year,
	director,
	max(runtime_mins) as longest_duration
from imdb_top_1000
Group by 1,2,3
order by 4 desc
limit 1

--List the movies with Meta Score above 95 alongside their IMDB ratings and directors.
Select
	movie,
	director,
	release_year,
	meta_score,
	imdb_rating 
from imdb_top_1000
Where meta_score > 95
order by 4 desc

--List the movie titles along with their average ratings for movies released in the last five years.
Select
	movie,
	release_year,
	avg(imdb_rating) as avg_rating
from imdb_top_1000
Where release_year >= 2016
Group by 1,2
Order by 3 desc

--List the top 10 movies by number of votes.
Select
	movie,
	star_actor,
	director,
	release_year,
	max(no_of_votes) as highest_votes
from imdb_top_1000
Group by 1,2,3,4
order by 5 desc
Limit 10
