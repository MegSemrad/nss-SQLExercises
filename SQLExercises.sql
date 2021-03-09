-- Doo not want to run all of code everytime hit the run button. To avoid this, select whatever it is 
-- that needs to be run and then press button. It is perfectly fine to leave old code. Can also comment 
-- out code as go along. 


INSERT INTO Genre (Label) VALUES ('Techno');


select SongLength from Song where Id = 18;


update Song
set SongLength = 515
where Id = 18;
-- Once you run the update statement, in order to make sure the value has changed, we run the select query again.
select SongLength from Song where Id = 18;


INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Good Day Sunshine', 350, '8/5/1966', 7, 6, 5);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Got To Get You Into My Life', 574, '8/5/1966', 7, 6, 5);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Interlude', 237, '12/03/1982', 13, 27, 1);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('What More Can I Say', 150, '12/03/1982', 13, 27, 1);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Encore', 260, '12/03/1982', 13, 27, 1);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Dirt Off Your Shoulder', 851, '12/03/1982', 13, 27, 1);



-- 1. Query all of the entries in the Genre table
        SELECT
            Id,
            Label
        FROM Genre;


-- 2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
        SELECT
            Id,
            ArtistName, 
            YearEstablished
        FROM Artist a
            ORDER BY a.ArtistName;


-- 3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
        SELECT s.Title,
            a.ArtistName
        FROM Song s
            LEFT JOIN Artist a on s.ArtistId = a.id;


-- 4. Write a SELECT query that lists all the Artists that have a Pop Album
        SELECT 
            Artist.ArtistName, 
            Genre.Label
        FROM Album
            LEFT JOIN Artist on Album.ArtistId = Artist.Id
            LEFT JOIN Genre on Album.GenreId = Genre.Id
        WHERE 
            GenreId = 7; -- there will be no results as no artist has a pop album



-- 5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album


-- 6. Write a SELECT statement that lists the Albums with no songs


-- 7. Using the INSERT statement, add one of your favorite artists to the Artist table.


-- 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.


-- 9. Using the INSERT statement, add some songs that are on that album to the Song table.