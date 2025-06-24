Use loja_online;

/* Exercicio 1
Crie uma Stored Procedure que calcule a média de quatro números
inteiros informados como parâmetro. Retorne o resultado da
operação e armazene os números e o resultado em uma tabela.
Além dos números a tabela deve ter um ID como chave primaria,
conter a data e o usuário que realizou a operação.
*/

#DROP PROCEDURE SPEx1;

/*
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS SPEx1(IN n1 INT, IN n2 INT, IN n3 INT, IN n4 INT, OUT resultado INT, IN dataInsercao DATE, IN usuario VARCHAR (20))
BEGIN
DECLARE media INT;
CREATE TABLE IF NOT EXISTS `Media`(
idMedia INT PRIMARY KEY AUTO_INCREMENT,
n1 INT NOT NULL,
n2 INT NOT NULL,
n3 INT NOT NULL,
n4 INT NOT NULL,
resultado INT NOT NULL,
dataInsercao DATE NOT NULL,
usuario VARCHAR (20) NOT NULL
);
SET media = (n1+n2+n3+n4);
SET resultado = media;
INSERT INTO Media (n1,n2,n3,n4, resultado, dataInsercao, usuario)
VALUES (n1,n2,n3,n4, resultado, dataInsercao, usuario);
END$$
DELIMITER ;

call SPEx1(12, 20, 30, 10, @resultado, '2024-09-30', 'Arthur');
Select @resultado; */

/* Exercicio 2
Crie uma Stored Procedure que some quantos clientes tem no
cadastro da loja_online e quantos fornecedores tambem estão
cadastrados. Crie a tabela colaboradores e insira 5 tuplas.
*/

#DROP PROCEDURE SPEx2;

/* DELIMITER $$
CREATE PROCEDURE SPEx2 (OUT cliente INT, OUT fornecedor INT)
BEGIN
DECLARE qtClientes INT;
DECLARE qtFornecedores INT;
SET qtClientes = (SELECT COUNT(idCLiente) FROM clientes);
SET cliente = qtClientes;
SET qtFornecedores = (SELECT COUNT(idFornecedor) FROM fornecedores);
SET fornecedor = qtFornecedores;
CREATE TABLE IF NOT EXISTS `colaboradores`(
idColaborador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
cpf VARCHAR (20) NOT NULL,
telefone VARCHAR (20) NOT NULL,
email VARCHAR (50) NOT NULL,
cargo VARCHAR (50) NOT NULL,
salario DECIMAL (8,2) NOT NULL
);
INSERT INTO colaboradores(nome, cpf, telefone, email, cargo, salario) VALUES
('ANA MARIA', '123,123,123-99', "(31)91234-5678", 'ana@gmail.com', 'DESENVOLVEDOR', 6000),
('JOSE MARIA', '321,321,321-00', "(31)94321-8765", 'jose@gmail.com', 'DESENVOLVEDOR', 5000),
('MARIA DA SILVA', '456,456,456-77', "(31)98765-4321", 'maria@gmail.com', 'DESENVOLVEDOR', 8000),
('MARTA OLIVEIRA', '876,876,876-12', "(31)91237-6543", 'marta@gmail.com', 'DESENVOLVEDOR', 5000),
('JULIANA SOUZA', '111,222,333-44', "(31)99876-1234", 'juliana@gmail.com', 'DESENVOLVEDOR', 9700);
END $$
DELIMITER ;

CALL SPEx2(@cliente, @fornecedor);
SELECT @cliente, @fornecedor;  */






/* Exercicio 3
Crie uma Stored Procedure para resolver o problema de Mariana,
ela quis usar uma fita para embrulhar um pacote. Após uma rápida
medição notou que bastavam 45cm (quarenta e cinto centímetros)
para embrulhar tal pacote. A papelaria aonde ela foi só vendia a fita por
4.00 reais a cada metro. Quanto Mariana teve que pagar para ter o tamanho
necessário de fita?
Observe a tabela abaixo:
Metro Decímetro Centímetro Milímetro
m dm cm mm
1m 0,1m 0,01m 0,001m
*/

#DROP PROCEDURE SPEx3;

/* DELIMITER $$
CREATE PROCEDURE SPEx3(OUT X DOUBLE)
BEGIN
DECLARE cm INT;
DECLARE resultado, valor double;
SET valor = 4/100;
SET cm = 45;
SET resultado = valor*cm;
SET X = RESULTADO;
END$$
DELIMITER ;

CALL SPEx3(@X);
SELECT @X; */




/* Exercicio 4
Crie uma Stored Procedure que leia um número e calcule o seu
quadrado, ou seja, o produto de um número por si mesmo depois
acrescente a esse numero a raiz quadrada de 81. Obs: deve-se
fazer a conta da raiz quadrada na procedure também.
*/

#DROP PROCEDURE SPEx4;

/*
DELIMITER $$
CREATE PROCEDURE SPEx4(IN x INT, OUT resultado INT)
BEGIN
DECLARE quadrado INT;
DECLARE raiz INT;
SET raiz = (SELECT SQRT(81));
SET quadrado = x * x;
SET resultado = quadrado + raiz;
END$$
DELIMITER ;

CALL SPEx4(3, @resultado);
SELECT @resultado; */






/* Exercicio 5
No Brasil a taxa de imposto de um determinado carro é de 52%, na
Argentina 21%, Crie uma Stored Procedure que apresente o custo
total do carro em ambos os países. OBS: os valores apresentados
são em reais para ambos os países.
Dados para calcular os valores:
BRASIL ARGENTINA
CUSTO TOTAL ? ?
CUSTO FABRICA 11000 8000
IMPOSTOS % 52 21
DISTRIBUIÇÃO_CUSTO 2450 1100
CONCESSIONÁRIA % 3.5 1.5
*/

#DROP PROCEDURE SPEx5;

/* DELIMITER $$
CREATE PROCEDURE SPEx5(OUT totalBrasil INT, OUT totalARG INT)
BEGIN
DECLARE custo_totalB INT;
DECLARE custo_totalA INT;
SET custo_totalB = (11000 + 11000 * 0.52 + 2450) + (11000 + 11000 * 0.52 + 2450) * 0.035;
SET custo_totalA = (8000 + 8000 * 0.21 + 1100) + (8000 + 8000 * 0.21 + 1100) * 0.015;
SET totalBrasil = custo_totalB;
SET totalARG = custo_totalA;
END$$
DELIMITER ;

CALL SPEx5(@totalBrasil, @totalARG);
SELECT @totalBrasil, @totalARG; */ 




/* Exercicio 6
Crie uma stored procedure onde se deve criar a tabela de
Cardápio com os preços abaixo, crie também uma tabela consumo.
Crie outra stored procedure que insere o consumo do cliente. Leia o
código do cliente, código do produto o preço unitário a quantidade
desse produto consumida e soma total de consumo do cliente.
Exemplo id=1,cliente= joao , quantidade=2 refrigerantes,
precounitario = 3 totalconsumido=6
Cardapio:
Hambúrguer................. R$ 3,00
Cheeseburger.............. R$ 2,50
Fritas............................ R$ 2,50
Refrigerante................. R$ 1,00
Milkshake..................... R$ 3,00
*/

#DROP PROCEDURE SPEx6;

DELIMITER $$
CREATE PROCEDURE SPEx6()
BEGIN





END$$
DELIMITER ;