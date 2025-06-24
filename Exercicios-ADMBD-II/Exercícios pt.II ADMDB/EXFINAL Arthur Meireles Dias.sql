#1. 
DROP SCHEMA IF EXISTS `NewtonLoc`;
CREATE SCHEMA `NewtonLoc`;
USE `NewtonLoc`;
-- -----------------------------------------------------
-- Table `NewtonLoc`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE `CLIENTES` (
 `idCliente` INT NOT NULL AUTO_INCREMENT,
 `nome` VARCHAR(45) NOT NULL,
 `cpf` CHAR(11) NOT NULL,
 `telefone` CHAR(11) NOT NULL,
 `email` VARCHAR(45) NOT NULL,
 `pontuacao` INT NOT NULL,
 `tipo` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`idCliente`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `NewtonLoc`.`Carros`
-- -----------------------------------------------------
CREATE TABLE `CARROS` (
 `idCarro` INT NOT NULL AUTO_INCREMENT,
 `fabricante` VARCHAR(45) NOT NULL,
 `modelo` VARCHAR(45) NOT NULL,
 `cor` VARCHAR(15) NOT NULL,
 `anoFabricacao` YEAR NOT NULL,
 `potenciaMotor` DECIMAL(4,1) NOT NULL,
 `categoria` VARCHAR(45) NOT NULL,
 `quilometragem` BIGINT NOT NULL,
 PRIMARY KEY (`idCarro`)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `NewtonLoc`.`Dimensoes`
-- -----------------------------------------------------
CREATE TABLE `DIMENSOES` (
 `idDimensao` INT NOT NULL AUTO_INCREMENT,
 `altura_mm` DECIMAL(4,3) NOT NULL,
 `largura_mm` DECIMAL(4,3) NOT NULL,
 `comprimento_mm` DECIMAL(4,3) NOT NULL,
 `peso_kg` INT NOT NULL,
 `tanque_L` INT NOT NULL,
 `entre_eixos_mm` DECIMAL(4,3) NOT NULL,
 `porta_mala_L` INT NOT NULL,
 `ocupante` INT NOT NULL,
 `fk_idCarro` INT NOT NULL,
 PRIMARY KEY (`idDimensao`),
 CONSTRAINT `fk_Dimensoes_Carros`
 FOREIGN KEY (`fk_idCarro`)
 REFERENCES `CARROS` (`idCarro`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `NewtonLoc`.`Locacao`
-- -----------------------------------------------------
CREATE TABLE `LOCACAO` (
 `idLocacao` INT NOT NULL AUTO_INCREMENT,
 `dataLocacao` DATE NOT NULL,
 `valorDiaria` DOUBLE NOT NULL,
 `fk_idCliente` INT NOT NULL,
 `fk_idCarro` INT NOT NULL,
 PRIMARY KEY (`idLocacao`),
 CONSTRAINT `fk_Locacao_Clientes`
 FOREIGN KEY (`fk_idCliente`)
 REFERENCES `CLIENTES` (`idCliente`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Locacao_Carros`
 FOREIGN KEY (`fk_idCarro`)
 REFERENCES `CARROS` (`idCarro`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
) ENGINE = InnoDB;
#2.-- Inserir dados na tabela CLIENTES
INSERT INTO CLIENTES (nome, cpf, telefone, email, pontuacao, tipo) VALUES
('Teclaudio Screen', '12341234121', '31987655434', 'te@gmail.com', 0, 'Basico'),
('Maria Teclas', '12332143445', '32987800987', 'm@gmail.com', 100, 'Basico'),
('Jonas Mouse', '44489865432', '31976533234', 'mouse@gmail.com', 500, 'Basico'),
('Carlos CPU', '45609087678', '31978900627', 'cpu@gmail.com', 1200, 'Intemediario'),
('Tiana Cooler', '67512399900', '31976432111', 'ti@gmail.com', 3000, 'Intermediario'),
('Cassandra Pixel', '88890097666', '31980077654', 'cas@gmail.com', 5600, 'Premium');
-- Inserir dados na tabela CARROS
INSERT INTO CARROS (fabricante, modelo, cor, anoFabricacao, potenciaMotor, categoria,
quilometragem) VALUES
('Fiat', 'Toro Freedom', 'preto', '2022', 1.8, 'SUV', 12000),
('Toyota', 'Yaris', 'Branco', '2022', 1.5, 'Sedan', 3000),
('Ford', 'Fiesta', 'Branco', '2021', 1.6, 'Hatch', 566),
('Toyota', 'Corolla', 'Branco', '2023', 2.0, 'Sedan', 1022),
('Hyundai', 'Hb20', 'Vermelho', '2023', 2.0, 'Hatch', 300),
('Volksvagen', 'Gol', 'Verde', '2020', 1.6, 'Hatch', 5059),
('Chevrolet', 'Onix', 'preto', '2019', 1.6, 'Hatch', 12034);
-- Inserir dados na tabela LOCACAO
INSERT INTO LOCACAO (dataLocacao, valorDiaria, fk_idCliente, fk_idCarro) VALUES
('2023-01-10', 123, 1, 1),
('2023-01-10', 183, 2, 2),
('2023-01-10', 100, 3, 3),
('2023-01-10', 199, 4, 4),
('2023-01-10', 99, 5, 5),
('2023-02-10', 183, 2, 2);
-- Inserir dados na tabela DIMENSOES
INSERT INTO DIMENSOES (altura_mm, largura_mm, comprimento_mm, peso_kg,
tanque_L, entre_eixos_mm, porta_mala_L, ocupante, fk_idCarro) VALUES
(1.475, 1.656, 3.892, 1020, 55, 2.467, 285, 5, 6), -- Gol
(1.480, 1.760, 4.540, 1230, 60, 2.600, 470, 5, 4), -- Corolla
(1.673, 1.844, 4.945, 1650, 55, 2.982, 0, 5, 1), -- Toro
(1.487, 1.765, 3.935, 1084, 54, 2.488, 270, 5, 3), -- Fiesta
(1.490, 1.730, 4.425, 1130, 45, 2.550, 473, 5, 2), -- Yaris
(1.470, 1.720, 4.015, 993, 50, 2.530, 300, 5, 5), -- Hb20
(1.471, 1.731, 4.163, 1034, 44, 2.551, 303, 5, 7); -- Onix

#3.-- Questão 1: Qual o modelo do carro que já foi alugado?
CREATE VIEW Md_carro_Alg AS
SELECT DISTINCT CARROS.modelo
FROM CARROS
JOIN LOCACAO ON CARROS.idCarro = LOCACAO.fk_idCarro;
SELECT * FROM Md_carro_Alg;

-- Questão 2: Qual o nome do cliente que já alugou um carro?
CREATE VIEW Nom_cliente_alug AS
SELECT DISTINCT CLIENTES.nome
FROM CLIENTES
JOIN LOCACAO ON CLIENTES.idCliente = LOCACAO.fk_idCliente;
SELECT * FROM Nom_cliente_alug;

-- Questão 3: Qual o nome do cliente que alugou o carro com a diária mais alta?
CREATE VIEW Clien_diar_alta AS
SELECT CLIENTES.nome
FROM CLIENTES
JOIN LOCACAO ON CLIENTES.idCliente = LOCACAO.fk_idCliente
WHERE LOCACAO.valorDiaria = (SELECT MAX(valorDiaria) FROM LOCACAO);
SELECT * FROM Clien_diar_alta;

-- Questão 4: Qual a categoria do carro que foi alugado por último?
CREATE VIEW Cat_carr_alg_ultimo AS
SELECT CARROS.categoria
FROM CARROS
JOIN LOCACAO ON CARROS.idCarro = LOCACAO.fk_idCarro
ORDER BY LOCACAO.dataLocacao DESC
LIMIT 1;
SELECT * FROM Cat_carr_alg_ultimo;

-- Questão 5: Qual o nome do fabricante(s) que produziu o carro(s) mais potente(s)?
CREATE VIEW Frab_mais_potente AS
SELECT DISTINCT CARROS.fabricante
FROM CARROS
WHERE CARROS.potenciaMotor = (SELECT MAX(potenciaMotor) FROM CARROS);
SELECT * FROM Frab_mais_potente;

-- Questão 6: Qual a cor da SUV locada no dia 2024-10-22?
CREATE VIEW SUV_Locdia AS
SELECT CARROS.cor
FROM CARROS
JOIN LOCACAO ON CARROS.idCarro = LOCACAO.fk_idCarro
WHERE CARROS.categoria = 'SUV' AND LOCACAO.dataLocacao = '2024-10-22';
SELECT * FROM SUV_Locdia;
-- Questão 7: Qual o modelo do carro, fabricante, cor que tem a menor diária?
CREATE VIEW Carr_menordiaria AS
SELECT CARROS.modelo, CARROS.fabricante, CARROS.cor
FROM CARROS
JOIN LOCACAO ON CARROS.idCarro = LOCACAO.fk_idCarro
WHERE LOCACAO.valorDiaria = (SELECT MIN(valorDiaria) FROM LOCACAO);
SELECT * FROM Carr_menordiaria;

-- Questão 8: Qual o modelo do carro e categoria que não foi alugado ainda?
CREATE VIEW Carr_NAO_Alg AS
SELECT CARROS.modelo, CARROS.categoria
FROM CARROS
WHERE CARROS.idCarro NOT IN (SELECT fk_idCarro FROM LOCACAO);
SELECT * FROM Carr_NAO_Alg;

-- Questão 9: Qual o nome do cliente que nunca alugou um carro do ano de fabricação 2013?
CREATE VIEW Client_SEM_Carr2013 AS
SELECT CLIENTES.nome
FROM CLIENTES
WHERE CLIENTES.idCliente NOT IN (
 SELECT LOCACAO.fk_idCliente
 FROM LOCACAO
 JOIN CARROS ON LOCACAO.fk_idCarro = CARROS.idCarro
 WHERE CARROS.anoFabricacao = 2013
);
SELECT * FROM Client_SEM_Carr2013;

-- Questão 10: Qual o nome do cliente que já alugou um carro SUV?
CREATE VIEW Clients_SUV AS
SELECT DISTINCT CLIENTES.nome
FROM CLIENTES
JOIN LOCACAO ON CLIENTES.idCliente = LOCACAO.fk_idCliente
JOIN CARROS ON LOCACAO.fk_idCarro = CARROS.idCarro
WHERE CARROS.categoria = 'SUV';
SELECT * FROM Clients_SUV;

-- Questão 11: Qual o nome do cliente que NÃO alugou um carro Sedan?
CREATE VIEW Client_NAO_carr_Sedan AS
SELECT DISTINCT CLIENTES.nome
FROM CLIENTES
WHERE CLIENTES.idCliente NOT IN (
 SELECT LOCACAO.fk_idCliente
 FROM LOCACAO
 JOIN CARROS ON LOCACAO.fk_idCarro = CARROS.idCarro
 WHERE CARROS.categoria = 'Sedan'
);
SELECT * FROM Client_NAO_carr_Sedan;

-- Questão 12: Qual a categoria do cliente que já alugou um carro com mais de 3000 quilômetros rodados?
CREATE VIEW Categ_Cliente_Carr_Mais3000KM AS
SELECT DISTINCT CLIENTES.tipo
FROM CLIENTES
JOIN LOCACAO ON CLIENTES.idCliente = LOCACAO.fk_idCliente
JOIN CARROS ON LOCACAO.fk_idCarro = CARROS.idCarro
WHERE CARROS.quilometragem > 3000;
SELECT * FROM Categ_Cliente_Carr_Mais3000KM;

-- Questão 13: Qual o modelo do carro que tem a menor altura?
CREATE VIEW Mod_Menor_alt AS
SELECT CARROS.modelo
FROM CARROS
JOIN DIMENSOES ON CARROS.idCarro = DIMENSOES.fk_idCarro
WHERE DIMENSOES.altura_mm = (SELECT MIN(altura_mm) FROM DIMENSOES);
SELECT * FROM Mod_Menor_alt;

-- Questão 14: Qual o tamanho do porta-malas do carro que é da categoria Hatch?
CREATE VIEW PortMala_Hatch AS
SELECT CARROS.modelo, DIMENSOES.porta_mala_L
FROM CARROS
JOIN DIMENSOES ON CARROS.idCarro = DIMENSOES.fk_idCarro
WHERE CARROS.categoria = 'Hatch';
SELECT * FROM PortMala_Hatch;

#-- Questão 15: Dez Subconsultas adicionais
--  1: Consulta para listar carros que têm mais de 5000 km e que foram fabricados após 2020?
SELECT modelo, quilometragem, anoFabricacao
FROM CARROS
WHERE quilometragem > 5000 AND anoFabricacao > 2020;
-- 2 : Encontre o cliente com maior pontuação?
 SELECT nome, pontuacao
FROM CLIENTES
WHERE pontuacao = (SELECT MAX(pontuacao) FROM CLIENTES);
-- 3 : Consulte a locação mais cara:
SELECT idLocacao, dataLocacao, valorDiaria
FROM LOCACAO
WHERE valorDiaria = (SELECT MAX(valorDiaria) FROM LOCACAO);
-- 4 : Consulte os carros que nao foram locados: 
SELECT modelo, fabricante
FROM CARROS
WHERE idCarro NOT IN (SELECT fk_idCarro FROM LOCACAO);
-- 5 : Encontre o cliente com menor pontuação?
SELECT nome, pontuacao
FROM CLIENTES
WHERE pontuacao = (SELECT MIN(pontuacao) FROM CLIENTES);
-- 6 : Consulte a lista de clientes que fizeram locação no mes de janeiro no ano de 2023:
SELECT nome, email
FROM CLIENTES
WHERE idCliente IN (SELECT fk_idCliente FROM LOCACAO WHERE dataLocacao BETWEEN '2023-01-01' AND '2023-01-31');
-- 7 : Consulte os clientes que tem o mesmo tipo de plano:
SELECT nome, tipo
FROM CLIENTES
WHERE tipo = 'Basico';
-- 8 : Consulte o carro mais recente de cada categoria:
SELECT categoria, modelo, anoFabricacao
FROM CARROS
WHERE (categoria, anoFabricacao) IN (
    SELECT categoria, MAX(anoFabricacao)
    FROM CARROS
    GROUP BY categoria
);

-- 9 : Consulte os carros com quilometragem superior à média de carros da mesma categoria;
SELECT modelo, quilometragem, categoria
FROM CARROS
WHERE quilometragem > (
    SELECT AVG(quilometragem)
    FROM CARROS AS sub
    WHERE sub.categoria = CARROS.categoria
);

-- 10 : Consulte para encontrar os carros com categoria "hatch" que possuem potencia maior que 2.0;
SELECT modelo, potenciaMotor
FROM CARROS
WHERE categoria = 'HATCH'
AND potenciaMotor > (SELECT AVG(potenciaMotor) FROM CARROS WHERE categoria = 'HATCH');


#--4 Crie uma trigger para monitorar a tabela locação. Ela deve registrar os dados do usuário, data de inserção de um registro, e quais foram os dados novos inseridos. Para isso crie uma tabela chamada log.

CREATE TABLE LOGIN (
 idLog INT AUTO_INCREMENT PRIMARY KEY,
 usuario VARCHAR(50) NOT NULL,
 dataInsercao DATETIME NOT NULL,
 dadosInseridos TEXT NOT NULL
) ENGINE = InnoDB;
DELIMITER $$
CREATE TRIGGER trig_inser_loc
AFTER INSERT ON LOCACAO
FOR EACH ROW
BEGIN
 DECLARE User_Atual VARCHAR(50);
 SET User_Atual = USER();
 INSERT INTO LOGIN (User_Atual, dataInsercao, dadosInseridos)
 VALUES (
 User_Atual,
 NOW(),
 CONCAT(
 'idLocacao: ', NEW.idLocacao, ', ',
 'dataLocacao: ', NEW.dataLocacao, ', ',
 'valorDiaria: ', NEW.valorDiaria, ', ',
 'fk_idCliente: ', NEW.fk_idCliente, ', ',
 'fk_idCarro: ', NEW.fk_idCarro
 )
 );
END$$
DELIMITER ;
INSERT INTO LOCACAO (dataLocacao, valorDiaria, fk_idCliente, fk_idCarro)
VALUES ('2024-11-15', 200, 1, 2);

#5.Analise o database e suas tabelas para implementar uma trigger que possa fazer a gestão da 
-- quilometragem dos carros que foram alugados;

CREATE TABLE DEVOLUCAO (
 idDevolucao INT AUTO_INCREMENT PRIMARY KEY,
 fk_idLocacao INT NOT NULL,
 KM_Final BIGINT NOT NULL,
 valorExtra DECIMAL(10, 2) NOT NULL DEFAULT 0,
 FOREIGN KEY (fk_idLocacao) REFERENCES LOCACAO(idLocacao)
 ON DELETE CASCADE
 ON UPDATE CASCADE
) ENGINE = InnoDB;
ALTER TABLE LOCACAO
ADD KM_Inicial BIGINT NOT NULL DEFAULT 0;


DELIMITER $$

CREATE TRIGGER TRIG_DEVOL
BEFORE INSERT ON DEVOLUCAO
FOR EACH ROW
BEGIN
 DECLARE KM_Maxima BIGINT;
 DECLARE KM_Percorrida BIGINT;
 DECLARE valor_Diar_Atual DECIMAL(10, 2);
 SET KM_Maxima = (SELECT km_Inicial + 1000 FROM LOCACAO WHERE idLocacao = NEW.fk_idLocacao);
 SET KM_Percorrida = NEW.KM_Final - (SELECT KM_Inicial FROM LOCACAO WHERE idLocacao = NEW.fk_idLocacao);
  IF KM_Final > KM_Maxima THEN
  SET Valor_Diar_Atual = (SELECT Valor_Diar FROM LOCACAO WHERE idLocacao = NEW.fk_idLocacao);
 SET NEW.valorExtra = valor_Diar_Atual * 0.30 * (KM_Percorrida - 1000) / 1000;
 END IF;
END$$
DELIMITER ;


INSERT INTO LOCACAO (dataLocacao, valorDiaria, fk_idCliente, fk_idCarro,
quilometragemInicial)
VALUES ('2024-11-15', 200, 1, 2, 2344);
INSERT INTO DEVOLUCAO (fk_idLocacao, KM_Final)
VALUES (1, 3400); 
INSERT INTO DEVOLUCAO (fk_idLocacao, KM_Final)
VALUES (1, 3500); 




#6. Crie 10 usuários com senha para acessar (Roles) conforme as restrições abaixo (Você decide quem acessa o que) cada acesso é uma Role

-- 01 : Configurações gerais
USE NewtonLoc;
FLUSH PRIVILEGES;
-- Acesso 1: Apenas SELECT em todas as tabelas
CREATE USER 'usuario_select'@'localhost' IDENTIFIED BY '123456';
GRANT SELECT ON NewtonLoc.* TO 'usuario_select'@'localhost';

-- Acesso 2: Apenas SELECT e INSERT na tabela CARROS
CREATE USER 'usuario_carros'@'LOCALHOST' IDENTIFIED BY '223019';
GRANT SELECT, INSERT ON NewtonLoc.CARROS TO 'usuario_carros'@'LOCALHOST';

-- Acesso 3: Acesso total ao sistema e database
CREATE USER 'usuario_admin'@'LOCALHOST' IDENTIFIED BY 'password10020786';
GRANT ALL PRIVILEGES ON NewtonLoc.* TO 'usuario_admin'@'LOCALHOST';

-- Acesso 4: CREATE, ALTER e DROP em tabelas e schema
CREATE USER 'usuario_schema'@'%' IDENTIFIED BY 'password789456';
GRANT CREATE, ALTER, DROP ON NewtonLoc.* TO 'usuario_schema'@'%';
-- Acesso 5: Total ao schema
CREATE USER 'usuario_totalschema'@'%' IDENTIFIED BY 'password000123';
GRANT ALL PRIVILEGES ON NewtonLoc.* TO 'usuario_totalschema'@'%';

-- Usuário 1: Apenas consulta na tabela CLIENTES
CREATE USER 'usuario_clientes'@'%' IDENTIFIED BY 'password291100';
GRANT SELECT ON NewtonLoc.CLIENTES TO 'usuario_clientes'@'%';

-- Usuário 2: Consulta e inserção na tabela LOCACAO
CREATE USER 'usuario_loc'@'%' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT ON NewtonLoc.LOCACAO TO 'usuario_loc'@'%';

-- Usuário 3: Gerenciamento total na tabela DEVOLUCAO
CREATE USER 'usuario_devol'@'%' IDENTIFIED BY 'password444555';
GRANT ALL PRIVILEGES ON NewtonLoc.DEVOLUCAO TO 'usuario_devol'@'%';

-- Usuário 4: Apenas consulta em CARROS e LOCACAO
CREATE USER 'usuario_views'@'%' IDENTIFIED BY 'password180703';
GRANT SELECT ON NewtonLoc.CARROS TO 'usuario_views'@'%';
GRANT SELECT ON NewtonLoc.LOCACAO TO 'usuario_views'@'%';

-- Usuário 5: Permissão de consulta e alteração na tabela DIMENSOES
CREATE USER 'usuario_dimen'@'%' IDENTIFIED BY 'password123';
GRANT SELECT, UPDATE ON NewtonLoc.DIMENSOES TO 'usuario_dimen'@'%';
FLUSH PRIVILEGES;
SELECT user, host FROM mysql.user;

#7.Entre os usuários criados acima, altere as permissões de 5. A sua escolha.
 
-- Alteração 1: Usuário 'usuario_select' agora pode também executar DELETE em todas as tabelas
REVOKE SELECT ON NewtonLoc.* FROM 'usuario_select'@'localhost';
GRANT DELETE ON NewtonLoc.* TO 'usuario_select'@'localhost';

-- Alteração 2: Usuário 'usuario_carros' agora pode executar INSERT em todas as tabelas:
REVOKE SELECT ON NewtonLoc.* FROM 'usuario_carros'@'localhost';
GRANT SELECT, INSERT ON NewtonLoc.* TO 'usuario_carros'@'localhost';

-- Alteração 3: Usuário 'usuario_loc' agora tem permissão adicional de SELECT em todas as tabelas
GRANT SELECT ON NewtonLoc.* TO 'usuario_loc'@'%';

-- Alteração 4: Usuário 'usuario_schema' perde a permissão de DROP em tabelas
REVOKE DROP ON NewtonLoc.* FROM 'usuario_schema'@'%';

-- Alteração 5: Usuário 'usuario_totalschema' agora pode também executar UPDATE na tabela LOCACAO
GRANT UPDATE ON NewtonLoc.LOCACAO TO 'usuario_totalschema'@'%';
-- Aplicar as permissões
FLUSH PRIVILEGES;

#8. Crie um índice para cada uma das tabelas acima:
-- Índice na tabela CLIENTES
CREATE INDEX ind_cpf ON CLIENTES(cpf);
CREATE INDEX ind_nome ON CLIENTES(nome);

-- Índice na tabela CARROS
CREATE INDEX ind_modelo ON CARROS(modelo);
CREATE INDEX ind_fabricante ON CARROS(fabricante);

-- Índice na tabela DIMENSOES
CREATE INDEX ind_fk_idCarro ON DIMENSOES(fk_idCarro);

-- Índice na tabela LOCACAO
CREATE INDEX ind_data_Locacao ON LOCACAO(dataLocacao);
CREATE INDEX ind_fk_indCliente ON LOCACAO(fk_idCliente);
CREATE INDEX ind_fk_indCarro ON LOCACAO(fk_idCarro);

-- Índice na tabela DEVOLUCAO
CREATE INDEX ind_fk_locacao ON DEVOLUCAO(fk_idLocacao);
CREATE INDEX ind_KM_final ON DEVOLUCAO(KM_final);

#9.Crie 20 perguntas e 20 respostas onde as respostas devem ser todas com Join.
-- Pergunta 1: "Quais clientes fizeram locações em janeiro de 2023 e quais carros foram alugados por eles"?
SELECT c.nome AS Cliente, ca.modelo AS Carro, l.dataLocacao
FROM CLIENTES c
JOIN LOCACAO l ON c.idCliente = l.fk_idCliente
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
WHERE l.dataLocacao BETWEEN '2023-01-01' AND '2023-01-31';

-- Pergunta 2: Quais carros foram alugados por clientes do tipo "Premium"?
SELECT CA.modelo, CA.fabricante, CA.cor
FROM CARROS CA
JOIN LOCACAO L ON CA.idCarro = L.fk_idCarro
JOIN CLIENTES C ON L.fk_idCliente = C.idCliente
WHERE C.tipo = 'Premium';

-- Pergunta 3: Quais clientes nunca alugaram carros?
SELECT c.nome
FROM CLIENTES c
LEFT JOIN LOCACAO l ON c.idCliente = l.fk_idCliente
WHERE l.idLocacao IS NULL;

-- Pergunta 4: Qual o modelo do carro mais alugado?
SELECT ca.modelo AS quantidade_alugado
FROM LOCACAO l
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
GROUP BY ca.modelo
ORDER BY quantidade_alugado DESC
LIMIT 1;

-- Pergunta 5: Quais os clientes que nunca alugaram um carro da categoria "SUV"?
SELECT C.nome
FROM CLIENTES C
LEFT JOIN LOCACAO L ON C.idCliente = L.fk_idCliente
LEFT JOIN CARROS CA ON L.fk_idCarro = CA.idCarro
WHERE CA.categoria != 'SUV' OR CA.categoria IS NULL;

-- Pergunta 6: Qual o modelo do carro mais potente alugado?
SELECT CA.modelo, CA.potenciaMotor
FROM CARROS CA
JOIN LOCACAO L ON CA.idCarro = L.fk_idCarro
ORDER BY CA.potenciaMotor DESC
LIMIT 1;

-- Pergunta 7: Quais modelos de carros foram alugados por clientes básicos?
SELECT ca.modelo, c.nome
FROM LOCACAO l
JOIN CLIENTES c ON l.fk_idCliente = c.idCliente
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
WHERE c.tipo = 'Basico';

-- Pergunta 8: Quais carros têm entre-eixos maior que 2.5 metros?
SELECT ca.modelo, d.entre_eixos_mm
FROM CARROS ca
JOIN DIMENSOES d ON ca.idCarro = d.fk_idCarro
WHERE d.entre_eixos_mm > 2.5;


-- Pergunta 9: Qual o tamanho do porta-malas dos carros alugados no dia 2024-11-15?
SELECT CA.modelo, D.porta_mala_L
FROM CARROS CA
JOIN LOCACAO L ON CA.idCarro = L.fk_idCarro
JOIN DIMENSOES D ON CA.idCarro = D.fk_idCarro
WHERE L.dataLocacao = '2024-11-15';

-- Pergunta 10:  Quais carros foram alugados mais de uma vez?
SELECT ca.modelo, COUNT(*) AS qtd_alugado
FROM LOCACAO l
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
GROUP BY ca.modelo
HAVING COUNT(*) > 1;

-- Pergunta 11: Qual o nome do cliente e o modelo do carro alugado pela última vez?
SELECT C.nome, CA.modelo
FROM CLIENTES C
JOIN LOCACAO L ON C.idCliente = L.fk_idCliente
JOIN CARROS CA ON L.fk_idCarro = CA.idCarro
ORDER BY L.dataLocacao DESC
LIMIT 1;

-- Pergunta 12: Quais clientes já alugaram o carro modelo 'Gol'?
SELECT c.nome, ca.modelo
FROM LOCACAO l
JOIN CLIENTES c ON l.fk_idCliente = c.idCliente
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
WHERE ca.modelo = 'Gol';


-- Pergunta 13: Qual a média da potência dos carros alugados por clientes "Intermediários"?
SELECT AVG(CA.potenciaMotor) AS media_potencia
FROM CARROS CA
JOIN LOCACAO L ON CA.idCarro = L.fk_idCarro
JOIN CLIENTES C ON L.fk_idCliente = C.idCliente
WHERE C.tipo = 'Intermediario';

-- Pergunta 14: Quais modelos de carros foram alugados em janeiro de 2023?
SELECT ca.modelo, l.dataLocacao
FROM LOCACAO l
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
WHERE l.dataLocacao BETWEEN '2023-01-01' AND '2023-01-31';

-- Pergunta 15: Quais os nomes dos clientes que alugaram o "Corolla"?
SELECT C.nome
FROM CLIENTES C
JOIN LOCACAO L ON C.idCliente = L.fk_idCliente
JOIN CARROS CA ON L.fk_idCarro = CA.idCarro
WHERE CA.modelo = 'Corolla';

-- Pergunta 16: Quais carros têm dimensões cadastradas?
SELECT ca.modelo, d.altura_mm, d.largura_mm, d.comprimento_mm
FROM CARROS ca
JOIN DIMENSOES d ON ca.idCarro = d.fk_idCarro;

-- Pergunta 17: Qual a soma total de pontuações dos clientes que alugaram carros?
SELECT SUM(c.pontuacao) AS total_pontuacao
FROM LOCACAO l
JOIN CLIENTES c ON l.fk_idCliente = c.idCliente;

-- Pergunta 18: Qual o cliente que alugou mais carros diferentes?
SELECT C.nome, COUNT(DISTINCT L.fk_idCarro) AS qtd_carros
FROM CLIENTES C
JOIN LOCACAO L ON C.idCliente = L.fk_idCliente
GROUP BY C.idCliente
ORDER BY qtd_carros DESC
LIMIT 1;

-- Pergunta 19:  Quais locações tiveram valor diário acima da média?
SELECT l.idLocacao, c.nome, ca.modelo, l.valorDiaria
FROM LOCACAO l
JOIN CLIENTES c ON l.fk_idCliente = c.idCliente
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
WHERE l.valorDiaria > (SELECT AVG(valorDiaria) FROM LOCACAO);


-- Pergunta 20: Qual cliente alugou o carro mais barato ?
SELECT c.nome, ca.modelo, l.valorDiaria
FROM LOCACAO l
JOIN CLIENTES c ON l.fk_idCliente = c.idCliente
JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
ORDER BY l.valorDiaria ASC
LIMIT 1;

#10.--Crie 10 procedures com tema livre.

-- Prod 1 : Listar clientes por tipo e pontuação mínima

DELIMITER $$
CREATE PROCEDURE ListarClientesPorTipo(
    IN p_tipo VARCHAR(45),
    IN p_pontuacaoMinima INT
)
BEGIN
    SELECT *
    FROM CLIENTES
    WHERE tipo = p_tipo AND pontuacao >= p_pontuacaoMinima;
END$$

DELIMITER ;

-- Prod 2: Buscar informações completas de um carro:

DELIMITER $$

CREATE PROCEDURE BuscarInformacoesCarro(
    IN p_idCarro INT
)
BEGIN
    SELECT ca.*, d.altura_mm, d.largura_mm, d.comprimento_mm, d.peso_kg, d.tanque_L, d.porta_mala_L, d.ocupante
    FROM CARROS ca
    JOIN DIMENSOES d ON ca.idCarro = d.fk_idCarro
    WHERE ca.idCarro = p_idCarro;
END$$

DELIMITER ;








-- Prod 3 : Atualizar o valor da diária de um carro:


DELIMITER $$

CREATE PROCEDURE AtualizarValorDiaria(
    IN p_idCarro INT,
    IN p_novoValor DOUBLE
)
BEGIN
    UPDATE LOCACAO
    SET valorDiaria = p_novoValor
    WHERE fk_idCarro = p_idCarro;
END$$

DELIMITER ;

-- Prod 4 :  Consultar locações por cliente

DELIMITER $$

CREATE PROCEDURE ConsultarLocacoesPorCliente(
    IN p_idCliente INT
)
BEGIN
    SELECT l.idLocacao, l.dataLocacao, l.valorDiaria, ca.modelo, ca.fabricante
    FROM LOCACAO l
    JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
    WHERE l.fk_idCliente = p_idCliente;
END$$

DELIMITER ;

-- Prod 5: Listar todos os carros disponíveis por categoria: 

DELIMITER $$

CREATE PROCEDURE ListarCarrosPorCategoria(
    IN p_categoria VARCHAR(45)
)
BEGIN
    SELECT *
    FROM CARROS
    WHERE categoria = p_categoria;
END$$

DELIMITER ;





-- Prod 6: Registrar uma nova locação:
DELIMITER $$

CREATE PROCEDURE RegistrarLocacao(
    IN p_dataLocacao DATE,
    IN p_valorDiaria DOUBLE,
    IN p_idCliente INT,
    IN p_idCarro INT
)
BEGIN
    INSERT INTO LOCACAO (dataLocacao, valorDiaria, fk_idCliente, fk_idCarro)
    VALUES (p_dataLocacao, p_valorDiaria, p_idCliente, p_idCarro);
END$$

DELIMITER ;

-- Prod 7: Insere um novo cliente:

DELIMITER $$

CREATE PROCEDURE InserirCliente(
    IN p_nome VARCHAR(45),
    IN p_cpf CHAR(11),
    IN p_telefone CHAR(11),
    IN p_email VARCHAR(45),
    IN p_pontuacao INT,
    IN p_tipo VARCHAR(45)
)
BEGIN
    INSERT INTO CLIENTES (nome, cpf, telefone, email, pontuacao, tipo)
    VALUES (p_nome, p_cpf, p_telefone, p_email, p_pontuacao, p_tipo);
END$$

DELIMITER ;

-- Prod 8: Inserir dimensões de um carro

DELIMITER $$

CREATE PROCEDURE InserirDimensoesCarro(
    IN p_idCarro INT,
    IN p_altura DECIMAL(4,3),
    IN p_largura DECIMAL(4,3),
    IN p_comprimento DECIMAL(4,3),
    IN p_peso INT,
    IN p_tanque INT,
    IN p_entreEixos DECIMAL(4,3),
    IN p_portaMala INT,
    IN p_ocupante INT
)


BEGIN
    INSERT INTO DIMENSOES (altura_mm, largura_mm, comprimento_mm, peso_kg, tanque_L, entre_eixos_mm, porta_mala_L, ocupante, fk_idCarro)
    VALUES (p_altura, p_largura, p_comprimento, p_peso, p_tanque, p_entreEixos, p_portaMala, p_ocupante, p_idCarro);
END$$

DELIMITER ;

-- Prod 9:  Relatório de locações por fabricante:

DELIMITER $$

CREATE PROCEDURE RelatorioLocacoesPorFabricante(
    IN p_fabricante VARCHAR(45)
)
BEGIN
    SELECT ca.fabricante, ca.modelo, COUNT(l.idLocacao) AS total_locações
    FROM LOCACAO l
    JOIN CARROS ca ON l.fk_idCarro = ca.idCarro
    WHERE ca.fabricante = p_fabricante
    GROUP BY ca.modelo, ca.fabricante;
END$$

DELIMITER ;

-- Prod 10: Relatório de quilometragem média por categoria
DELIMITER $$

CREATE PROCEDURE QuilometragemMediaPorCategoria()
BEGIN
    SELECT categoria, AVG(quilometragem) AS quilometragem_media
    FROM CARROS
    GROUP BY categoria;
END$$

DELIMITER ;
