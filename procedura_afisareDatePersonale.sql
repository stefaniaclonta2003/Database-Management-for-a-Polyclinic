--selectare utilizatori datee.personale
DELIMITER //

CREATE PROCEDURE SelectUtilizator(IN utilizatorID INT)
BEGIN
    SELECT Nume, Prenume, CNP, rol_user, Email, Adresa, Telefon, Cont_IBAN, Numar_Contract, Data_Angajarii
    FROM proiect.utilizatori
    WHERE ID_Utilizator = utilizatorID;
END //

DELIMITER ;
CALL SelectUtilizator(1);
