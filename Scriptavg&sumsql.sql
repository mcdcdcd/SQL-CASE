                                                         --Problem Statement
--As a data analyst, one of the key tasks is to identify high-value customers based on their spending habits.
--The goal of this SQL query is to find customers whose total invoice amounts exceed the average total invoice amount across all customers. 
--This insight can help businesses target their most valuable customers for loyalty programs, special offers, or personalized marketing campaigns.
                                                         
                                                
-- We are working with a dataset that contains two main tables:
--1.Customer - Contains customer details such as CustomerId, FirstName, and City.
--2.Invoice - Contains invoice details including InvoiceId, CustomerId, and Total of each invoice.

                                                         
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













