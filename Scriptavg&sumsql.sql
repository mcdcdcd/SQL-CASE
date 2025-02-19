                                           
-- Solution
                                                                                                             
WITH sumtotal AS (    

        -- Create a temporary table to calculate total spend per customer
    SELECT  
        c.FirstName,  
        c.City,  
        SUM(i.Total) AS STI  --Calculate the total spending (SumTotalInvoice) for each customer by summing up their invoice totals. 
        
    FROM Customer c 
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.FirstName, c.City  
    
),
    average_total AS (     --Compute the average total spending across all customers.
 
        Select avg(STI) as avg_spend from sumtotal --Calculate the second requirement from the first time table which is sumtotal. 

)
    SELECT  
        -- Select customers who spent more than the average
        tpc.FirstName,   
        tpc.City,  
        tpc.STI  
    FROM sumtotal tpc   -- first with clause 
    JOIN average_total at ON tpc.STI > at.avg_spend;













