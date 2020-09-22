DROP DATABASE peliculas;

-- 1. Crear base de datos llamada películas
CREATE DATABASE peliculas;
\c peliculas
-- 2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,determinando 
CREATE TABLE peliculas
(id INT PRIMARY KEY,
 pelicula VARCHAR(70),
 anyo_estreno INT,
 director VARCHAR(50)
);
CREATE TABLE reparto
(id_pelicula INT ,
 actor VARCHAR(30),
 FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);
-- 3. Cargar ambos archivos a su tabla correspondiente
\copy peliculas FROM 'peliculas.csv' CSV HEADER;
\copy reparto FROM 'reparto.csv' csv;
-- 4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,
-- año de estreno, director y todo el reparto.S
SELECT actor, pelicula, anyo_estreno, director  FROM peliculas
JOIN reparto ON peliculas.id=reparto.id_pelicula WHERE peliculas.pelicula = 'Titanic';
-- 5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula  FROM peliculas
JOIN reparto ON peliculas.id=reparto.id_pelicula WHERE reparto.actor = 'Harrison Ford';
-- 6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.
SELECT director , count(*) FROM peliculas GROUP BY director ORDER BY count(*) DESC LIMIT 10 ;
-- 7. Indicar cuantos actores distintos hay 
SELECT count(DISTINCT actor) FROM reparto ;
-- 8. Indicar las películas estrenadas entre los 
-- años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.
SELECT pelicula, anyo_estreno  FROM peliculas WHERE anyo_estreno>=1990  AND anyo_estreno <= 1999 ORDER BY pelicula ASC;
-- 9. Listar el reparto de las películas lanzadas el año 2001 (1 punto)
SELECT actor, pelicula, anyo_estreno FROM peliculas
JOIN reparto ON peliculas.id=reparto.id_pelicula WHERE anyo_estreno=2001;
-- 10. Listar los actores de la película más nueva (1 punto)
SELECT pelicula, año,  actors FROM peliculas LEFT JOIN reparto ON peliculas.id_pelicula= reparto.id_reparto ORDER BY año DESC, pelicula;