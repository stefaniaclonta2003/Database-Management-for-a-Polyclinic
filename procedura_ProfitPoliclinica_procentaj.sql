DELIMITER //

CREATE PROCEDURE CalculProfitPoliclinica(IN medicID INT)
BEGIN
    DECLARE medicProfit DECIMAL(10, 2);
    DECLARE policlinicaProfit DECIMAL(10, 2);

    -- Calculează profitul medicului
    SELECT SUM(p.Valoare * m.Procent_Servicii / 100) INTO medicProfit
    FROM proiect.medici m
    JOIN proiect.programari pr ON m.ID_Medic = pr.ID_Medic
    JOIN proiect.bonurifiscale p ON pr.ID_Programare = p.ID_Programare
    WHERE m.ID_Medic = medicID;

    -- Calculează profitul policlinicii pentru medic
    SELECT SUM(p.Valoare) INTO policlinicaProfit
    FROM proiect.programari pr
    JOIN proiect.bonurifiscale p ON pr.ID_Programare = p.ID_Programare
    WHERE pr.ID_Medic = medicID;

    -- Afișează profitul medicului
    SELECT medicProfit AS ProfitMedic;

    -- Afișează profitul policlinicii pentru medic
    SELECT policlinicaProfit AS Profit;
END //

DELIMITER ;



CALL CalculProfitPoliclinica(2);
