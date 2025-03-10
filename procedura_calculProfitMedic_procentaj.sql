
DELIMITER //

CREATE PROCEDURE CalculProfitMedic(IN medicID INT)
BEGIN
    DECLARE medicProfit DECIMAL(10,2);

    SELECT SUM(p.Valoare * m.Procent_Servicii / 100) INTO medicProfit
    FROM proiect.medici m
    JOIN proiect.programari pr ON m.ID_Medic = pr.ID_Medic
    JOIN proiect.bonurifiscale p ON pr.ID_Programare = p.ID_Programare
    WHERE m.ID_Medic = medicID;

    SELECT medicProfit AS ProfitMedic;
END //

DELIMITER ;

CALL CalculProfitMedic(3);