- respuesta 1
CREAR  BASE DE DATOS  peliculas ;
- respuesta 2
CREAR  TABLA  peliculas (id INT , pelicula VARCHAR ( 70 ), año SMALLINT , director VARCHAR ( 100 ), PRIMARY KEY (id));
CREAR  TABLA  reparto (id INT , actores VARCHAR ( 70 ), CLAVE EXTRANJERA (id) REFERENCIAS peliculas (id));
- respuesta 3
\ copy peliculas FROM  ' /home/patan/Escritorio/DATA_BASE/pelicula/peliculas.csv ' CSV HEADER;
\ copy reparto FROM  ' /home/patan/Escritorio/DATA_BASE/pelicula/reparto.csv ' CSV HEADER;
- respuesta 4
SELECCIONE  peliculas . pelicula , peliculas . a ño,   peliculas . director , reparto . actores  DE peliculas, reparto DONDE pelicula = ' Titanic ' ;
- respuesta 5
SELECCIONE  peliculas . pelicula  DE reparto, peliculas DONDE actores = ' Harrison Ford '  Y  peliculas . id  =  reparto . id ;
- respuesta 6
SELECCIONE al director, cuente ( * ) DE peliculas GRUPO POR director ORDEN POR conteo DESC  LIMIT  10 ;
- respuesta 7
SELECCIONE  EL CONTEO ( DISTINTOS actores) DESDE reparto;
- respuesta 8
SELECCIONE pelicula, año DE peliculas DONDE año > =  1990  Y año <=  1999  ORDEN POR año ASC ;
- respuesta 9
SELECCIONE  reparto . actores , peliculas . a ño DE reparto, peliculas DONDE año =  2001  Y  peliculas . id  =  reparto . id ;
- respuesta 10
SELECCIONE pelicula, año, actores DE peliculas IZQUIERDA ÚNETE reparto EN  peliculas . id  =  reparto . ID  PEDIDO POR año DESC , pelicula;