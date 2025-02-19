


SELECT 
    c.CustomerId AS Id_Customer, 
    c.FirstName, 
    COUNT(i.InvoiceId) AS Total_Invoices, --Count Customer´s bills 
    SUM(i.Total) AS total_bill, --Sum total_bill
    c.Country,
    
    CASE 
        WHEN SUM(i.Total) > 40 AND c.Country = 'USA' THEN '70% OFF'  -- If the customer  is living in USA add 70 off
        WHEN SUM(i.Total) > 40 THEN '50% OFF'    -- When the total amount of each customer exceeds $40 so add 50 off 
        ELSE 'Requerimiento no elegible'
    END AS Discount
    
FROM Customer c 
INNER JOIN Invoice i ON c.CustomerId = i.CustomerId 
GROUP BY c.CustomerId, c.FirstName, c.Country 
ORDER BY total_bill DESC;


