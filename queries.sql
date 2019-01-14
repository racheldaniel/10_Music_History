-- Query all of the entries in the Genre table
SELECT *
FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist (artistName, yearEstablished)
values("The Way Down Wanderers", 2016)

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album
values( null, "Wellspring", "2015", 7624, "4th Ridge Records", 31, 8)

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song
values( null, "No Braking Now", 123, "2015", 8, 31, 24)

INSERT into Song
values( null, "Circles", 123, "2015", 8, 31, 24)

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT S.Title as song_title, Al.Title as album_title, Ar.ArtistName as artist_name
FROM Song as S
LEFT JOIN Artist as Ar ON S.ArtistId = Ar.ArtistId
LEFT JOIN Album as Al ON Ar.ArtistId = Al.ArtistId
WHERE Ar.ArtistId = 31

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT A.Title as album_title, count(S.SongId) as song_count
FROM Album as A
JOIN Song as S ON A.AlbumId = S.AlbumId
GROUP BY A.Title

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT A.ArtistName as artist_name, count(S.SongId) as song_count
FROM Artist as A
JOIN Song as S ON A.ArtistId = S.ArtistId
GROUP BY A.ArtistName

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT G.Label as genre_name, count(S.SongId) as song_count
FROM Genre as G
JOIN Song as S ON G.GenreId = S.GenreId
GROUP BY G.Label

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, Max(AlbumLength) as duration
FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, Max(SongLength) as duration
FROM Song

-- Modify the previous query to also display the title of the album.
SELECT S.Title, A.Title, Max(S.SongLength) as duration
FROM Song as S
JOIN Album as A on S.AlbumId = A.AlbumId