En orden de sacar  la mayor informacion posible de nuestros datos, la  limpieza de ellos es  un requisito  indispensable. 
	Aqui veremos  buenas practicas al momento de  limpiar nuestra data con valores null,
	Con el objetivo de generar reportes que nos muestre informacion valiosa del negocio. 
	
Empezaremos creando una Transaccion con el fin de evitar actualizaciones erroneas en nuestra base de datos.

begin transaction; --Iniciamos Transaccion para garantizar la integridad y consistencia de los datos.
UPDATE Invoice  -- Actualizamos la tabla
SET BillingState = --Configuramos el campo  de eleccion
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
WHERE BillingState ISNULL; 
rollback;
SELECT BillingPostalCode, BillingCity
FROM Invoice
WHERE BillingPostalCode IS NULL
GROUP BY BillingCity;
BEGIN TRANSACTION;
Update Invoice 
SET BillingPostalCode = 
case 
	when BillingCity = "na" then "25721"
    else "54544"
end
where billingPostalCode  = "na"; 

select State  , Country from Customer c group by Country ;
Begin Transaction;
------------------------------------------
Caso de uso
UPDATE  Track 
set Composer =
case random()  % 4   -- Genera un valor aletorio entre 0 y 8 
	when 0 then "Nicola compensar"
	when 1 then "Ana salvarmenta  piijka"
	when 2 then "Lobito"
	when 3 then "Conelak kioport"
	when 4 then "Salome hernandez"
	
	else "Alejito Moreno"
end
Where Composer ISNULL ;

rollback;



