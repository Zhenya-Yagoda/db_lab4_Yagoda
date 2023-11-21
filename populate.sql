---------------------------
-- Populate director table
---------------------------
INSERT INTO director(id_director,name_d)
VALUES('1000001', 'Stanley Kubrick');
INSERT INTO director(id_director,name_d)
VALUES('1000002', 'Randal Kleiser');
INSERT INTO director(id_director,name_d)
VALUES('1000003', 'Irvin Kershner');
INSERT INTO director(id_director,name_d)
VALUES('1000004', 'Jim Abrahams');
INSERT INTO director(id_director,name_d)
VALUES('1000005', 'Harold Ramis');
INSERT INTO director(id_director,name_d)
VALUES('1000006', 'George A. Romero');
INSERT INTO director(id_director,name_d)
VALUES('1000007', 'Lewis Teague');
--------------------------
-- Populate star table
--------------------------

INSERT INTO star(id_star,name_s)
VALUES('2000001', 'Jack Nicholson');
INSERT INTO star(id_star,name_s)
VALUES('2000002', 'Brooke Shields');
INSERT INTO star(id_star,name_s)
VALUES('2000003', 'Mark Hamill');
INSERT INTO star(id_star,name_s)
VALUES('2000004', 'Robert Hays');
INSERT INTO star(id_star,name_s)
VALUES('2000005', 'Chevy Chase');
INSERT INTO star(id_star,name_s)
VALUES('2000006', 'Matthew Modine');
INSERT INTO star(id_star,name_s)
VALUES('2000007', 'Hal Holbrook');
INSERT INTO star(id_star,name_s)
VALUES('2000008', 'Dee Wallace');

------------------------
-- Populate writer table
------------------------

INSERT INTO writer(id_writer,name_w)
VALUES('3000001', 'Stephen King');
INSERT INTO writer(id_writer,name_w)
VALUES('3000002', 'Henry De Vere Stacpoole');
INSERT INTO writer(id_writer,name_w)
VALUES('3000003', 'Leigh Brackett');
INSERT INTO writer(id_writer,name_w)
VALUES('3000004', 'Jim Abrahams');
INSERT INTO writer(id_writer,name_w)
VALUES('3000005', 'Brian Doyle-Murray');
INSERT INTO writer(id_writer,name_w)
VALUES('3000006', 'Stanley Kubrick');

-------------------------
-- Populate movie table
-------------------------
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country,id_director,id_star)
VALUES('4000001', 'The Shining', 'R', 'Drama', '1980', '8.4', '19000000.0', 'United Kingdom','1000001','2000001');
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country,id_director,id_star)
VALUES('4000002', 'The Blue Lagoon', 'R', 'Adventure', '1980', '5.8', '4500000.0', 'United States','1000002','2000002');
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country,id_director,id_star)
VALUES('4000003', 'Star Wars: Episode V - The Empire Strikes Back', 'PG', 'Action', '1980', '8.7', '18000000.0', 'United States','1000003','2000003');
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country,id_director,id_star)
VALUES('4000004', 'Airplane!', 'PG', 'Comedy', '1980', '7.7', '3500000.0', 'United States','1000004','2000004');
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country,id_director,id_star)
VALUES('4000005', 'Caddyshack', 'R', 'Comedy', '1980', '7.3', '6000000.0', 'United States','1000005','2000005');

INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country,id_director,id_star)
VALUES('4000006', 'Full Metal Jacket', 'R', 'Drama', '1987', '8.3', '30000000.0', 'United Kingdom','1000001','2000006');
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country, id_director, id_star)
VALUES('4000007', 'Creepshow', 'R', 'Comedy', '1982', '6.9', '8000000.0', 'United States', '1000006', '2000007');
INSERT INTO movie(id_movie, name_f, rating, genre, year_m, score, budget, country, id_director, id_star)
VALUES('4000008', 'Cujo', 'R', 'Horror', '1983', '6.1', '5000000.0', 'United States', '1000007', '2000008');

----------------------------
-- Populate has table
----------------------------
INSERT INTO has(id_movie,id_writer)
VALUES('4000001','3000001');
INSERT INTO has(id_movie,id_writer)
VALUES('4000002','3000002');
INSERT INTO has(id_movie,id_writer)
VALUES('4000003','3000003');
INSERT INTO has(id_movie,id_writer)
VALUES('4000004','3000004');
INSERT INTO has(id_movie,id_writer)
VALUES('4000005','3000005');
INSERT INTO has(id_movie,id_writer)
VALUES('4000006','3000006');
INSERT INTO has(id_movie,id_writer)
VALUES('4000007','3000001');
INSERT INTO has(id_movie,id_writer)
VALUES('4000008','3000001');