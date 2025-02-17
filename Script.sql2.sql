

SELECT
    ar.Name AS ArtistName,
    al.Title AS AlbumTitle,
    t.Name AS TrackName,
    CASE
        WHEN (SELECT COUNT(*) FROM Artist ar2 WHERE ar2.Name = ar.Name) < 10
        THEN 'VIP'
        ELSE 'No VIP'
    END AS ArtistStatus
FROM
    Artist ar
INNER JOIN
    Album al ON ar.ArtistId = al.ArtistId
INNER JOIN
    Track t ON al.AlbumId = t.AlbumId
GROUP BY
    ar.Name, al.Title, t.Name
ORDER BY
    ar.Name, al.Title, t.Name;


