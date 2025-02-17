--Use Case: Identifying VIP Customers Based on Purchase Frequency
--Actor: Alejandro CEO of idk-yet 

1. --A database containing customer purchase history exists and is accessible.
2. -- The database includes at least the following tables and columns:
    
        -- Customer table with a CustomerID (primary key) and CustomerName (or similar identifier)
        -- Purchase table with a PurchaseID (primary key), CustomerID (foreign key referencing Customer), and PurchaseDate.
    
3. -- Entitys are;
    Artist, Tracjk, Album 
    
SELECT
    ar.Name AS ArtistName,      -- I get the name of the artirst as ArtistName 
    al.Title AS AlbumTitle,     -- """"""
    t.Name AS TrackName,        -- """""
    CASE
        WHEN (SELECT COUNT(*) FROM Sales Sa2 WHERE Sa2.total_sales = ar.Name) < 10  -- i  count  how many purchases a specific customer has,  depending of the value  we need to activate a plan to make the customer buys much. 
        THEN 'VIP' 
        ELSE 'No VIP'
    END AS ArtistStatus
FROM
    Artist ar
INNER JOIN
    Album al ON ar.ArtistId = al.ArtistId   -- I get the join between the tables 
INNER JOIN
    Track t ON al.AlbumId = t.AlbumId
GROUP BY
    ar.Name, al.Title, t.Name
ORDER BY
    ar.Name, al.Title, t.Name;


