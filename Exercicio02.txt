# ----- Exercicios Funcoes ----
# 1 Crie uma Função que: pesquise um nome que termine com a letra S na tabela
Fornecedores

USE loja_online;

DELIMITER $$

CREATE OR REPLACE FUNCTION EX1()
RETURNS varchar(100)
BEGIN
RETURN(SELECT nome FROM Fornecedores WHERE nome LIKE '$S');

END $$
DELIMITER ;

SELECT EX1();



# 2 Crie uma Função que: Retire os seguintes caracteres do texto abaixo: * . - !
# Ta*lvez v.ocê ain*da n.ão saiba o que é *SQL. Ma.s, -provavelm-ente, ente-nde
que lidar com
# o gerenciamento é super importante.
# d-e da-dos t+em se to+rna.do um d!!esafio cada vez maior


DELIMITER $$

CREATE OR REPLACE FUNCTION EX2 (retira VARCHAR(500))
RETURNS VARCHAR(500) DETERMINISTIC
BEGIN
RETURN (REPLACE(REPLACE(REPLACE(REPLACE(retira, '*', ''), '.', ''), '-', ''), '!', ''));

END $$
DELIMITER ;
SELECT EX2("Ta*lvez v.ocê ain*da n.ão saiba o que é *SQL. Ma.s, -provavelm-ente, ente-nde
que lidar com
o gerenciamento é super importante.
 d-e da-dos t+em se to+rna.do um d!!esafio cada vez maior");




# 3 Crie uma Função que: Calcule a média de 3 valores

DELIMITER $$

CREATE OR REPLACE FUNCTION EX3 (VAL1 INT, VAL2 INT, VAL3 INT)
RETURNS INT DETERMINISTIC
BEGIN
DECLARE MEDIA INT;
SET MEDIA = (VAL1 + VAL2 + VAL3)/3;
RETURN(MEDIA);

END $$
DELIMITER ;

SELECT EX3(3, 6, 9);





# 4 Crie uma Função que: Calcule a expressao : x+2(y-1)*5+x;

DELIMITER $$
CREATE FUNCTION FExpressao(x DOUBLE, y DOUBLE)
RETURNS DOUBLE DETERMINISTIC
BEGIN
DECLARE resultado DOUBLE;
SET resultado = x+2*(y-1)*5+x;
RETURN resultado;
END $$

DELIMITER ;
Select FExpressao(2,2);



# 5 Crie uma Função que: apresente um texto com palavras escritas ao contrario.
# precisam ser 3 palavras e todas devem ser palímdromos

DELIMITER $$

CREATE OR REPLACE FUNCTION EX5 (texto VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
SET texto =(REVERSE(texto));
RETURN texto;

END $$
DELIMITER ;

SELECT EX5 ('!satarip sod ier o ieres uE') AS CONTRÁRIO;



# 6 Crie uma Função que: dê 5% de desconto em uma venda realizada.

USE loja_online;

DELIMITER $$

CREATE OR REPLACE FUNCTION EX6 ()
RETURNS DOUBLE
BEGIN

DECLARE aux, resultado double;
SELECT valorTotalPedido INTO aux FROM pedidos AS Valor_de_Venda;
SET resultado = aux * 0.9;
RETURN resultado;

END $$
DELIMITER ;

SELECT EX6() AS Desconto;


** Em Relação ao exercício 6, não foi permitido o retorno de múltiplas linhas devido a uma limitação do SGBD utilizado (PHPMyAdmin), ao qual escolhido por dificuldades enfrentadas ao usar o WorkBanch. O Sistema não permite o retorno de multiplas linhas e também não reconhece 'TABLE' em 'RETURNS TABLE' como um tipo de dado permitido. **
