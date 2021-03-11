/*  
    Do not want to run all of code everytime hit the run button. To avoid this, select whatever it is 
    that needs to be run and then press button. It is perfectly fine to leave old code. Can also comment 
    out code as go along. 
*/




INSERT INTO Genre (Label) VALUES ('Techno');




SELECT SongLength FROM Song WHERE Id = 18;




UPDATE Song
SET SongLength = 515
WHERE Id = 18;
-- Once you run the update statement, in order to make sure the value has changed, we run the select query again.
SELECT SongLength FROM Song WHERE Id = 18;




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
            LEFT JOIN Artist a ON s.ArtistId = a.id;




-- 4. Write a SELECT query that lists all the Artists that have a Pop Album
        SELECT 
            Artist.ArtistName, 
            Genre.Label
        FROM Album
            LEFT JOIN Artist ON Album.ArtistId = Artist.Id
            LEFT JOIN Genre ON Album.GenreId = Genre.Id
        WHERE 
            GenreId = 7; -- there will be no results as no artist has a pop album




-- 5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
        SELECT 
            Artist.ArtistName, 
            Genre.Label
        FROM Album
            LEFT JOIN Artist ON Album.ArtistId = Artist.Id
            LEFT JOIN Genre ON Album.GenreId = Genre.Id
        WHERE 
            GenreId = 2 OR GenreId = 4;




-- 6. Write a SELECT statement that lists the Albums with no songs




-- 7. Using the INSERT statement, add one of your favorite artists to the Artist table.
        INSERT INTO Artist(ArtistName, YearEstablished) VALUES ('Adele', 2007)




-- 8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
        INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('19', '01/28/2008', 4341, 'XL Recordings', 29, 1)




-- 9. Using the INSERT statement, add some songs that are on that album to the Song table.

        INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('DayDreamer', 341, '01/28/2008', 1, 29, 27)
        INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Chasing Pavements', 331, '01/28/2008', 1, 29, 27)
        INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Best For Last', 419, '01/28/2008', 1, 29, 27)




-- 10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered 
--     in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album 
--     and artist you added.
-- THIS EXAMPLE DONE IN CLASS   
        Select *
            FROM Song s 
                LEFT JOIN Album al ON s.AlbumId = al.Id
                LEFT JOIN Artist ar ON s.ArtistId = ar.Id
            WHERE s.Title = 'TV Party' 
                OR s.Title = 'Thug' 
                OR ar.ArtistName = 'Beatles'


        -- this will give back  names/titles only and not the additional information attatched to those tables         
        Select s.Title, al.Title, ar.ArtistName
            FROM Song s 
                LEFT JOIN Album al ON s.AlbumId = al.Id
                LEFT JOIN Artist ar ON s.ArtistId = ar.Id
            WHERE s.Title = 'TV Party' 
                OR s.Title = 'Thug' 
                OR ar.ArtistName = 'Beatles'
        

        -- can create alias as some column titles might be ambiguous (previously both song and album title columns were titled "Title")         
        Select s.Title AS SongTitle, al.Title AS AlbumTitle, ar.ArtistName
            FROM Song s 
                LEFT JOIN Album al ON s.AlbumId = al.Id
                LEFT JOIN Artist ar ON s.ArtistId = ar.Id
            WHERE s.Title = 'TV Party' 
                OR s.Title = 'Thug' 
                OR ar.ArtistName = 'Beatles'




-- 11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
-- THIS EXAMPLE DONE IN CLASS 

        -- aggregate funcation is make single value out of many (?)
        SELECT count(s.id) AS SongCount, al.Title           -- and then count the number of dong ids within each group 
            FROM song s 
                LEFT JOIN  Album al ON s.AlbumId = al.Id    -- will be getting information from both song and album 
            GROUP BY al.Title                               -- group by album title 


        -- Write this way if wish to add artist's name associate with each album
        SELECT count(s.id) AS SongCount, al.Title as AlbumTitle, ar.ArtistName 
            FROM song s 
                LEFT JOIN  Album al ON s.AlbumId = al.Id
                LEFT JOIN Artist ar ON al.ArtistId = ar.Id
            GROUP BY al.Title, ar.ArtistName 





-- 12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
-- THIS EXAMPLE DONE IN CLASS 
        SELECT count(s.id), ar.ArtistName
        FROM  song s LEFT JOIN Artist ar ON s.ArtistId = ar.id
        GROUP BY ar.ArtistName

        UNION

        SELECT 0, ar.ArtistName
        FROM Artist ar LEFT JOIN Song s ON ar.Id = s.ArtistId
        WHERE s.id IS NULL




-- 13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
-- THIS EXAMPLE DONE IN CLASS        
        SELECT count(s.id), g.Label
        FROM  song s LEFT JOIN Genre g ON s.GenreId = g.id
        GROUP BY g.Label

        UNION

        SELECT 0, g.label
        FROM genre g LEFT JOIN Song s ON g.Id = s.GenreId
        WHERE s.id IS NULL




-- 14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE 
--     clause, use the HAVING keyword
-- THIS EXAMPLE DONE IN CLASS 
        SELECT COUNT(DISTINCT al.label), ar.ArtistName
        FROM Artist ar JOIN Album al ON ar.id = al.ArtistId
        GROUP BY ar.ArtistName
        HAVING COUNT(DISTINCT al.label) > 1




-- 15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
-- THIS EXAMPLE DONE IN CLASS         
        SELECT al.Title, al.AlbumLength
        FROM Album al
        WHERE al.AlbumLength = (
            SELECT MAX(al.albumlength) 
            FROM album al
        );

        SELECT TOP 1 al.Title, al.albumlength
        FROM Album al
        ORDER BY al.AlbumLength DESC;




-- 16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
-- THIS EXAMPLE DONE IN CLASS         
        SELECT s.Title, s.SongLength
        FROM song s
        WHERE s.SongLength = (
            SELECT MAX(s.SongLength) 
            FROM song s
        );

        SELECT TOP 1 s.Title, s.SongLength
        FROM song s 
        ORDER BY s.SongLength DESC;




-- 17. Modify the previous query to also display the title of the album.
-- THIS EXAMPLE DONE IN CLASS 
        SELECT TOP 1 s.Title, s.SongLength, al.Title
        FROM song s 
        JOIN Album al ON s.AlbumId = al.id
        ORDER BY s.SongLength DESC;