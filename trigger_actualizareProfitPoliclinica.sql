DELIMITER //

CREATE TRIGGER actualizeaza_venit
AFTER INSERT ON proiect.bonurifiscale
FOR EACH ROW
BEGIN
    DECLARE user_policlinica INT;

    -- Assuming that ID_Pacient uniquely identifies a patient in the pacienti table
    SELECT policlinici.ID_Policlinica INTO user_policlinica
    FROM policlinici
    JOIN bonurifiscale ON policlinici.ID_Policlinica = bonurifiscale.ID_Policlinica
    JOIN pacienti ON pacienti.ID_Pacient = NEW.ID_Programare
    WHERE bonurifiscale.ID_Programare = NEW.ID_Programare
    LIMIT 1;

    IF user_policlinica IS NOT NULL THEN
        -- Verificăm și actualizăm corect coloana corespunzătoare (Profit sau Venit, depinde de denumirea coloanei)
        UPDATE proiect.policlinici 
        SET Profit = Profit + NEW.Valoare 
        WHERE ID_Policlinica = user_policlinica;
    END IF;
END;
//
DELIMITER ;
