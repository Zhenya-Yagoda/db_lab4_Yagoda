CREATE TABLE Director
(
  id_director INT NOT NULL,
  name_d VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_director)
);

CREATE TABLE Star
(
  id_star INT NOT NULL,
  name_s VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_star)
);

CREATE TABLE Writer
(
  id_writer INT NOT NULL,
  name_w VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_writer)
);

CREATE TABLE Movie
(
  id_movie INT NOT NULL,
  name_f VARCHAR(50) NOT NULL,
  rating VARCHAR(15),
  genre VARCHAR(30) NOT NULL,
  year_m INT NOT NULL,
  score FLOAT NOT NULL,
  budget FLOAT,
  country VARCHAR(30) NOT NULL,
  id_director INT NOT NULL,
  id_star INT NOT NULL,
  PRIMARY KEY (id_movie),
  FOREIGN KEY (id_director) REFERENCES Director(id_director),
  FOREIGN KEY (id_star) REFERENCES Star(id_star)
);

CREATE TABLE has
(
  id_movie INT NOT NULL,
  id_writer INT NOT NULL,
  PRIMARY KEY (id_movie, id_writer),
  FOREIGN KEY (id_movie) REFERENCES Movie(id_movie),
  FOREIGN KEY (id_writer) REFERENCES Writer(id_writer)
);