CREATE USER 'Arthur'@'localhost' IDENTIFIED BY '2604';
CREATE USER 'Scar'@'localhost' IDENTIFIED BY '1212';
CREATE USER 'Katara'@'localhost' IDENTIFIED BY '6969';
CREATE USER 'Sara'@'localhost' IDENTIFIED BY '3535';
CREATE USER 'Yoru'@'localhost' IDENTIFIED BY '3578';
CREATE USER 'Admin'@'localhost' IDENTIFIED BY '2345678';

CREATE ROLE 'Nivel1'@'localhost';
CREATE ROLE 'Nivel2'@'localhost';
CREATE ROLE 'Nivel3'@'localhost';
CREATE ROLE 'Nivel4'@'localhost';
CREATE ROLE 'Nivel5'@'localhost';

GRANT ALL ON lojainformatica2.* TO 'Nivel1'@'localhost';
GRANT DELETE ON lojainformatica2.* TO 'Nivel2'@'localhost';
GRANT UPDATE ON lojainformatica2.* TO 'Nivel3'@'localhost';
GRANT INSERT ON lojainformatica2.vendas TO 'Nivel5'@'localhost';
GRANT SELECT ON lojainformatica2.produtos TO 'Nivel5'@'localhost';

GRANT 'Nivel1'@'localhost' TO 'Arthur'@'localhost';
SET DEFAULT ROLE 'Nivel1'@'localhost' TO 'Arthur'@'localhost';
GRANT 'Nivel2'@'localhost' TO 'Scar'@'localhost';
SET DEFAULT ROLE 'Nivel2'@'localhost' TO 'Scar'@'localhost';
GRANT 'Nivel3'@'localhost' TO 'Katara'@'localhost';
SET DEFAULT ROLE 'Nivel3'@'localhost' TO 'Katara'@'localhost';
GRANT 'Nivel4'@'localhost' TO 'Sara'@'localhost';
SET DEFAULT ROLE 'Nivel4'@'localhost' TO 'Sara'@'localhost';
GRANT 'Nivel5'@'localhost' TO 'Yoru'@'localhost';
SET DEFAULT ROLE 'Nivel5'@'localhost' TO 'Yoru'@'localhost';


GRANT 'Nivel1'@'localhost' TO 'Admin'@'localhost';
SET DEFAULT ROLE 'Nivel1'@'localhost' TO 'Admin'@'localhost';
GRANT 'Nivel2'@'localhost' TO 'Admin'@'localhost';
SET DEFAULT ROLE 'Nivel2'@'localhost' TO 'Admin'@'localhost';
GRANT 'Nivel3'@'localhost' TO 'Admin'@'localhost';
SET DEFAULT ROLE 'Nivel3'@'localhost' TO 'Admin'@'localhost';
GRANT 'Nivel4'@'localhost' TO 'Admin'@'localhost';
SET DEFAULT ROLE 'Nivel4'@'localhost' TO 'Admin'@'localhost';
GRANT 'Nivel5'@'localhost' TO 'Admin'@'localhost';
SET DEFAULT ROLE 'Nivel5'@'localhost' TO 'Admin'@'localhost';

SELECT USER FROM mySQL.User;
SHOW GRANTS FOR 'Arthur'@'localhost';
SHOW GRANTS FOR 'Scar'@'localhost';
SHOW GRANTS FOR'Katara'@'localhost';
SHOW GRANTS FOR 'Sara'@'localhost';
SHOW GRANTS FOR 'Yoru'@'localhost';
SHOW GRANTS FOR 'Admin'@'localhost';
