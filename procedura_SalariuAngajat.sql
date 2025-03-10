--salarii angajari detalii

DELIMITER //

CREATE PROCEDURE SelectSalariuAngajat(IN utilizatorID INT)
BEGIN
    SELECT u.nume, u.prenume, a.salariu
    FROM proiect.utilizatori u
    JOIN proiect.angajati a ON u.ID_Utilizator = a.ID_Utilizator
    WHERE u.ID_Utilizator = utilizatorID;
END //

DELIMITER ;

