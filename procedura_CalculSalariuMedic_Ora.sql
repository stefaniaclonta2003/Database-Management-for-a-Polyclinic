DELIMITER //

CREATE PROCEDURE CalculSalariuOra(IN medicID INT)
BEGIN
    DECLARE salariuLunar DECIMAL(10, 2);
    DECLARE oreLucrate INT;
    DECLARE salariuOra DECIMAL(10, 2);

    -- Obține salariul lunar al medicului
    SELECT Salariu INTO salariuLunar
    FROM proiect.medici m
    JOIN proiect.angajati a ON m.ID_Angajat = a.ID_Angajat
    WHERE m.ID_Medic = medicID;

    -- Obține numărul de ore lucrate de medic
    SELECT Ore_Lucrate INTO oreLucrate
    FROM proiect.angajati
    WHERE ID_Angajat = medicID;

    -- Calculează salariul pe oră
    SET salariuOra = salariuLunar / oreLucrate;

    -- Afișează salariul pe oră
    SELECT salariuOra AS SalariuOra;
END //

DELIMITER ;
