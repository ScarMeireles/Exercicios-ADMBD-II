CREATE ROLE 'Nivel1'@'localhost';
CREATE ROLE 'Nivel2'@'localhost';
CREATE ROLE 'Nivel3'@'localhost';
CREATE ROLE 'Nivel4'@'localhost';
CREATE ROLE 'Nivel5'@'localhost';

GRANT SELECT ON lojainformatica2.* TO 'Nivel1'@'localhost';

GRANT INSERT ON lojainformatica2.clientes TO 'Nivel2'@'localhost';
GRANT CREATE ON lojainformatica2.* TO 'Nivel2'@'localhost';
GRANT DROP ON lojainformatica2.* TO 'Nivel2'@'localhost';

GRANT SELECT ON lojainformatica2.vendas TO 'Nivel3'@'localhost';

GRANT SELECT ON lojainformatica2.* TO 'Nivel4'@'localhost';
GRANT INSERT ON lojainformatica2.* TO 'Nivel4'@'localhost';
GRANT UPDATE ON lojainformatica2.* TO 'Nivel4'@'localhost';
GRANT DELETE ON lojainformatica2.* TO 'Nivel4'@'localhost';

GRANT UPDATE ON lojainformatica2.vendas TO 'Nivel5'@'localhost';

CREATE USER 'Arthur'@'localhost';
CREATE USER 'Katara'@'localhost';
CREATE USER 'Scar'@'localhost';
CREATE USER 'Samira'@'localhost';
CREATE USER 'Yoru'@'localhost';
CREATE USER 'Zeri'@'localhost';
CREATE USER 'Kayn'@'localhost';
CREATE USER 'Rhaast'@'localhost';
CREATE USER 'Viego'@'localhost';
CREATE USER 'Yotora'@'localhost';

GRANT 'Nivel1'@'localhost' TO 'Arthur'@'localhost';
SET DEFAULT ROLE 'Nivel1'@'localhost' TO 'Arthur'@'localhost';
GRANT 'Nivel2'@'localhost' TO 'Katara'@'localhost';
SET DEFAULT ROLE 'Nivel2'@'localhost' TO 'Katara'@'localhost';
GRANT 'Nivel3'@'localhost' TO 'Scar'@'localhost';
SET DEFAULT ROLE 'Nivel3'@'localhost' TO 'Scar'@'localhost';
GRANT 'Nivel4'@'localhost' TO 'Samira'@'localhost';
SET DEFAULT ROLE 'Nivel4'@'localhost' TO 'Samira'@'localhost';
GRANT 'Nivel5'@'localhost' TO 'Yoru'@'localhost';
SET DEFAULT ROLE 'Nivel5'@'localhost' TO 'Yoru'@'localhost';
GRANT 'Nivel1'@'localhost' TO 'Zeri'@'localhost';
SET DEFAULT ROLE 'Nivel1'@'localhost' TO 'Zeri'@'localhost';
GRANT 'Nivel2'@'localhost' TO 'Kayn'@'localhost';
SET DEFAULT ROLE 'Nivel2'@'localhost' TO 'Kayn'@'localhost';
GRANT 'Nivel3'@'localhost' TO 'Rhaast'@'localhost';
SET DEFAULT ROLE 'Nivel4'@'localhost' TO 'Rhast'@'localhost';
GRANT 'Nivel4'@'localhost' TO 'Viego'@'localhost';
SET DEFAULT ROLE 'Nivel4'@'localhost' TO 'Viego'@'localhost';
GRANT 'Nivel5'@'localhost' TO 'Yotora'@'localhost';
SET DEFAULT ROLE 'Nivel5'@'localhost' TO 'Yotora'@'localhost';

REVOKE SELECT ON lojainformatica2.* FROM 'Nivel1'@'localhost';
GRANT CREATE ON lojainformatica2.* TO 'Nivel1'@'localhost';
GRANT DROP ON lojainformatica2.* TO 'Nivel1'@'localhost';

