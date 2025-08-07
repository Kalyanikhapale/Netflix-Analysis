CREATE DATABASE netflix_db;
USE netflix_db;

RENAME TABLE netflix_dataset TO netflix;

ALTER TABLE netflix ADD COLUMN added_date DATE;

UPDATE netflix
SET added_date = STR_TO_DATE(date_added, '%M %d, %Y')
WHERE date_added IS NOT NULL;


-- 1. Count the number of Movies vs TV Shows

SELECT type, COUNT(*) AS count
FROM netflix
GROUP BY type;


-- 2. Find the most common rating for movies and TV shows

SELECT type, rating, COUNT(*) AS count
FROM netflix
GROUP BY type, rating
ORDER BY type, count DESC;


-- 3. List all movies released in a specific year (e.g., 2020)

SELECT title
FROM netflix
WHERE type = 'Movie' AND release_year = 2020;


-- 4. Find the top 5 countries with the most content on Netflix

SELECT country, COUNT(*) AS count
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY count DESC
LIMIT 5;


-- 5. Identify the longest movie

SELECT title, duration
FROM netflix
WHERE type = 'Movie' AND duration LIKE '%min'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;


-- 6. Find content added in the last 5 years

SELECT title, added_date
FROM netflix
WHERE added_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT title, added_date
FROM netflix
WHERE added_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);


-- 8. List all TV shows with more than 5 seasons

SELECT title, duration
FROM netflix
WHERE type = 'TV Show'
  AND duration LIKE '%Season%'
  AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5;


-- 9. Count the number of content items in each genre

SELECT listed_in AS genre, COUNT(*) AS count
FROM netflix
GROUP BY listed_in
ORDER BY count DESC;


-- 10.Find each year and the average numbers of content release in India on netflix.

SELECT release_year, COUNT(*) AS total_content,
       ROUND(AVG(COUNT(*)) OVER (), 2) AS avg_per_year
FROM netflix
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY release_year;


-- 11. List all movies that are documentaries

SELECT title
FROM netflix
WHERE type = 'Movie' AND listed_in LIKE '%Documentary%';


-- 12. Find all content without a director

SELECT title, type
FROM netflix
WHERE director IS NULL OR director = '';


-- 13. Find how many movies actor 'Aishwarya Rai Bachchan' appeared in last 10 years!

SELECT COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
  AND cast LIKE '%Aishwarya Rai Bachchan%'
  AND release_year >= YEAR(CURDATE()) - 10;


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT actor, COUNT(*) AS total_movies
FROM (
    SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, ',', n.n), ',', -1)) AS actor
    FROM netflix
    JOIN (
        SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
        UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
    ) AS n
    ON CHAR_LENGTH(cast) - CHAR_LENGTH(REPLACE(cast, ',', '')) >= n.n - 1
    WHERE type = 'Movie'
      AND country LIKE '%India%'
      AND cast IS NOT NULL
) AS actors
GROUP BY actor
ORDER BY total_movies DESC
LIMIT 10;


-- 15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. 
-- Label content containing these keywords as 'Bad' and all other content as 'Good'.
-- Count how many items fall into each category.

SELECT 
  CASE 
    WHEN LOWER(description) LIKE '%kill%' OR LOWER(description) LIKE '%violence%' THEN 'Bad'
    ELSE 'Good'
  END AS category,
  COUNT(*) AS count
FROM netflix
GROUP BY category;



