/*
 * TODO: Create a table called 'songs' that has the following fields:
 * - id - integer, primary key
 * - name - string
 * - album_id - foreign key
 * 
 * Note that album - song is a one-to-many relationship, so no bridge table is needed.
 */
CREATE TABLE songs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(70) NOT NULL,
  album_id INTEGER NOT NULL,
  FOREIGN KEY(album_id) REFERENCES Albums(id) 
 );
  
CREATE TABLE Albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    artist VARCHAR(70) NOT NULL,
    year_published INTEGER NOT NULL
);

/* 
 * TODO: Insert at least 4 rows of data into the songs table. You can change up the albums as well. :)
 */
 INSERT INTO songs 
   (name, album_id)
 VALUES
     ('Cynical', 5),
     ('Bored To Death', 5),
     ('She''s Out Of Her Mind', 5),
     ('Speak To Me', 1),
     ('Breathe', 1),
     ('On The Run', 1),
     ('Hotel California', 3),
     ('New Kid In Town', 3),
     ('Life In The Fast Lane', 3)
 ;
 
 INSERT INTO Albums
     (name, artist, year_published)
 VALUES
     ('The Dark Side of the Moon', 'Pink Floyd', 1973),
     ('Abbey Road', 'The Beatles', 1969),
     ('Hotel California', 'Eagles', 1976),
     ('Born in the U.S.A.', 'Bruce Springsteen', 1984),
     ('California', 'Blink-182', 2016)
 ;


/* Queries */

-- SELECT * FROM Songs;

SELECT * FROM Albums;

/* TODO: Write a query here to select all songs */
SELECT * FROM songs;
SELECT * FROM Albums;

/* 
 * TODO: Write a table join query to construct a table of Song Name : Album Name
 */
SELECT songs.name AS song_name, Albums.name AS album_name FROM songs
 JOIN Albums ON
  album_id = Albums.id;
 /*
 * TODO: Find all albums published between 1970 and 1980.
 */
SELECT Albums.*, Albums.year_published FROM Albums
WHERE year_published <='1980' AND year_published>='1970';
/*
 * TODO: Find all songs on albums published between 1970 and 1980. 
 *(Hint: Use a table join.)
 */
SELECT songs.name AS song_name, Albums.name, Albums.year_published FROM songs
 JOIN Albums ON
  album_id = Albums.id
 WHERE year_published <='1980' AND year_published>='1970';
/*
 * TODO: Find all songs on albums with names containing 'California'.
 */
SELECT songs.name AS song_name, Albums.name AS album_name FROM songs
  JOIN Albums on 
   album_id = Albums.id
 WHERE Albums.name LIKE ('%California%');