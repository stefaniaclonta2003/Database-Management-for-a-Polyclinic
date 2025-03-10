DELIMITER //

CREATE PROCEDURE SelectRaportMedic(IN utilizatorID INT)
BEGIN
    SELECT u.nume, u.prenume, r.Continut, r.ID_Raport
    FROM proiect.utilizatori u
    JOIN proiect.programari p ON u.ID_Utilizator = p.ID_Pacient
    JOIN proiect.rapoartemedicale r ON p.ID_Programare = r.ID_Programare
    WHERE u.ID_Utilizator = utilizatorID;
END //

DELIMITER ;

