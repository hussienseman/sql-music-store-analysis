-- Query 1: First 10 customers and their countries
SELECT FirstName, LastName, Country
FROM Customer
LIMIT 10;

-- Query 2: Top 5 countries with most customers
SELECT Country, COUNT(*) AS num_customers
FROM Customer
GROUP BY Country
ORDER BY num_customers DESC
LIMIT 5;

-- Query 3: Top 5 customers by total spending
SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;

-- Query 4: Number of tracks per genre
SELECT g.Name AS Genre, COUNT(t.TrackId) AS NumberOfTracks
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY NumberOfTracks DESC;

-- Query 5: Artist with the highest total sales
SELECT ar.Name AS Artist, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY TotalSales DESC
LIMIT 1;
