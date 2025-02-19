

begin transaction; 
--Begin a transaction to ensure data integrity
UPDATE Invoice 
-- Update missing BillingState values based on BillingCountry	
SET BillingState = 
Case 
	When BillingCountry = "USA" THEN "NC"
	When BillingCountry = "Canada" then "SK"      
	When BillingCountry = "Brazil" then "CE" 
	when BillingCountry = "Argentina" then "CD"
	when BillingCountry = "Australia" then "NSW"
	when BillingCountry = "Austria" then "NÖ"
	when BillingCountry = "Belgium" then "BRU"
	when BillingCountry = "Germany" then "HB"
	when BillingCountry = "Portugal" then "PBB"
	when BillingCountry = "United Kingdom" then "LV"
	else "NA"
END
WHERE BillingState ISNULL; -- -- Ensure we only update NULL values
rollback;
-- Update missing Composer values with randomly assigned name
untry ;
Begin Transaction;
------------------------------------------
Caso de uso
UPDATE  Track 
set Composer =
case random()  % 4   -- Generates a random value between 0 and 4 
	when 0 then "REQUERIMIENTO"
	when 1 then "DMORENO75"
	when 2 then "Lobito"
	when 3 then "aLEJANDRO87MOreno"
	when 4 then "idkholdin22group"
	
	else "Alejo Moreno"
end
Where Composer ISNULL ; -- Only update NULL composers
rollback;
--Rollback the transaction to prevent permanent changes (for testing)

