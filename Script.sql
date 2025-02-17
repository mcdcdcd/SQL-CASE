En orden de sacar  la mayor informacion posible de nuestros datos, la  limpieza de ellos es  un requisito  indispensable. 
	Aqui veremos  buenas practicas al momento de  limpiar nuestra data con valores null,
	Con el objetivo de generar reportes que nos muestre informacion valiosa del negocio. 
	
Empezaremos creando una Transaccion con el fin de evitar actualizaciones erroneas en nuestra base de datos.

begin transaction; --Iniciamos Transaccion para garantizar la integridad y consistencia de los datos.
UPDATE Invoice  -- Actualizamos la tabla
SET BillingState = --Configuramos el campo  de eleccion
Case 
	When BillingCountry = "USA" THEN "NC"
	When BillingCountry = "Canada" then "SK"       - Para cada valor faltante  entonces añadimos un requerimiento 
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

untry ;
Begin Transaction;
------------------------------------------
Caso de uso
UPDATE  Track 
set Composer =
case random()  % 4   -- Genera un valor aletorio entre 0 y 8 
	when 0 then "REQUERIMIENTO"
	when 1 then "DMORENO75"
	when 2 then "Lobito"
	when 3 then "aLEJANDRO87MOreno"
	when 4 then "idkholdin22group"
	
	else "Alejo Moreno"
end
Where Composer ISNULL ; --Donde el requerimiento deba registrarse 

rollback;



