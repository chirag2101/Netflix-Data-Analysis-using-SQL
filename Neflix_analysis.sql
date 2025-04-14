-- Retrieve All Data
SELECT *FROM netflix;

-- Count Total Records
SELECT COUNT(*) FROM netflix;

-- Find Unique Categories
SELECT DISTINCT type FROM netflix;

-- Filter by Rating: Retrieve all TV Shows that have a "TV-MA" rating.
SELECT  type, title,rating FROM netflix 
WHERE type = 'TV Show' 
AND rating = 'TV-MA';

-- Sort by Release Year: Display the first 10 movies sorted by release year (latest first).
SELECT type, title, release_year FROM netflix 
WHERE type = 'Movie' 
ORDER BY release_year DESC 
LIMIT 10;

-- Display the movies which released in 2015
SELECT title,release_year
FROM netflix
WHERE type = 'Movie' AND release_year=2015 AND director IS NOT NULL AND country IS NOT NULL
ORDER BY title ;

-- Find Top Genres: Count how many times each category (listed_in) appears.
SELECT listed_in, COUNT(*) AS count 
FROM netflix 
GROUP BY listed_in 
ORDER BY count DESC;

-- Count Movies and TV Shows Separately: Get the count of Movies and TV Shows.
SELECT type, COUNT(*) 
FROM netflix 
GROUP BY type;

-- Find the Most Recent TV Show or Movie: Get the latest added title.
SELECT title, date_added FROM netflix 
ORDER BY date_added DESC 
LIMIT 1;

-- Find the Oldest Movie in the Dataset: Get the oldest movie based on release year.
SELECT title, date_added FROM netflix 
WHERE type = 'Movie' 
ORDER BY date_added 
LIMIT 1;

-- Find Movies Released After 2015: Get all movies released after 2015.
SELECT type,title,release_year FROM netflix 
WHERE type = 'Movie' 
AND release_year > 2015;

-- Find Directors Who Directed More Than One Movie: List directors with multiple movies.
SELECT director, COUNT(*) AS mcount 
FROM netflix 
WHERE type = 'Movie' 
GROUP BY director 
HAVING COUNT(*) > 1;

-- Get the Most Common Rating: Find which rating appears most frequently.
SELECT rating, COUNT(*) AS rcount
FROM netflix
GROUP BY rating
ORDER BY rcount DESC
LIMIT 1;

-- Find the Country with the Most Titles: Identify which country has the most entries.
SELECT country, COUNT(*) AS ccount
FROM netflix
GROUP BY country
ORDER BY ccount DESC
LIMIT 1;

-- Find the 5 Longest Movie Duration: Get the longest duration of a movie.
SELECT title, duration 
FROM netflix 
WHERE type = 'Movie' 
ORDER BY CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INTEGER) DESC 
LIMIT 5;

-- Find top 5 TV Shows with the Highest Number of Seasons: Get the TV Show with the maximum seasons.
SELECT title, duration 
FROM netflix 
WHERE type = 'TV Show' 
ORDER BY CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INTEGER) DESC 
LIMIT 5;

--  Find the top 5 Most Frequent Cast Member
SELECT casts, COUNT(*) AS appearances 
FROM netflix 
GROUP BY casts 
ORDER BY appearances DESC 
LIMIT 5;


-- Find the Top 5 Directors with the Most Movies
SELECT director, COUNT(*) AS d_appearances
FROM netflix
WHERE type = 'Movie'
GROUP BY director
ORDER BY d_appearances DESC
LIMIT 5;

-- Find All Titles That Belong to Multiple Genres
SELECT title, listed_in
FROM netflix
WHERE listed_in LIKE '%,%';

-- Identify the Most Popular Genre for TV Shows
SELECT listed_in, COUNT(*) AS gcount
FROM netflix
WHERE type = 'TV Show'
GROUP BY listed_in
ORDER BY gcount DESC
LIMIT 1;

--  Find the Country with the Most TV Shows
SELECT country, COUNT(*) AS tv_show_count
FROM netflix
WHERE type = 'TV Show'
GROUP BY country
ORDER BY tv_show_count DESC
LIMIT 1;

-- Find the Number of Movies and TV Shows Released Each Year
SELECT release_year, type, COUNT(*)
FROM netflix
GROUP BY release_year, type
ORDER BY release_year DESC;

-- Identify Directors Who Have Worked in Multiple Countries
SELECT director, COUNT(DISTINCT country) AS country_count 
FROM netflix 
WHERE director IS NOT NULL 
GROUP BY director 
HAVING COUNT(DISTINCT country) > 1 
ORDER BY country_count DESC;


