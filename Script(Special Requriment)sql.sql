


SELECT 
    c.CustomerId AS Id_Customer, 
    c.FirstName, 
    COUNT(i.InvoiceId) AS Total_Invoices, 
    SUM(i.Total) AS total_bill,
    c.Country,
    
    CASE 
        WHEN SUM(i.Total) > 40 AND c.Country = 'USA' THEN '70% OFF'
        WHEN SUM(i.Total) > 40 THEN '50% OFF'
        ELSE 'Requerimiento no elegible'
    END AS Discount
    
FROM Customer c 
INNER JOIN Invoice i ON c.CustomerId = i.CustomerId 
GROUP BY c.CustomerId, c.FirstName, c.Country 
ORDER BY total_bill DESC;




