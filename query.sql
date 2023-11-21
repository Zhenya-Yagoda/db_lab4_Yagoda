-- 1. кількість фільмів в кожного сценариста
SELECT writer.name_w, COUNT(has.id_movie) AS movie_count
FROM writer
LEFT JOIN has ON writer.id_writer = has.id_writer
GROUP BY writer.name_w;

-- 2. кількість фільмів в кожного режисера
SELECT director.name_d, COUNT(movie.id_movie) AS movie_count
FROM director
LEFT JOIN movie ON director.id_director = movie.id_director
GROUP BY director.name_d;

--3.список режисерів та середніх рейтингів їхніх фільмів на IMDb
SELECT director.name_d,AVG(movie.score) AS avg_imdb_score
FROM director
JOIN movie ON director.id_director = movie.id_director
GROUP BY director.id_director;