# -- Views
# 1 Crie uma view que apresente o total de pedidos do dia 2024-08-21

CREATE OR REPLACE VIEW VEX1 AS
SELECT COUNT(pedidos.idPedido) AS NUMERO_PEDIDOS
FROM pedidos WHERE pedidos.dataped = '2024/08/21';
SELECT * FROM vex1;



# 2 Crie uma view que apresente o total de pedidos já realizados(total)

CREATE OR REPLACE VIEW VEX2 AS
SELECT COUNT(pedidos.idPedido) AS Todos_Pedidos
from pedidos;
SELECT * FROM vex2;



# 3 Crie uma view que apresente o nome dos clientes que ja fizeram um pedido

CREATE OR REPLACE VIEW VEX3 AS
SELECT C.nome
FROM clientes AS C
JOIN pedidos AS P
ON (C.idCliente = P.fk_id_Cliente);
SELECT * FROM VEX3;



# 4 Crie uma view que apresente os produtos que já foram PEDIDOS

CREATE OR REPLACE VIEW VEX4 AS
SELECT PRO.idProduto,PRO.descricao, PRO.tipo, PED.dataped
FROM pedidos AS PED
JOIN itemspedidos AS ITPED
ON (PED.idPedido = ITPED.fk_id_Pedido)
JOIN produtos AS PRO
ON (ITPED.fk_id_Produto = PRO.idProduto);
SELECT * FROM VEX4;



# 5 Crie uma view que apresente o lucro que rendeu um produto qualquer

USE loja_online;
CREATE OR REPLACE VIEW VEX5 AS
SELECT descricao, precoVenda, precoCompra, (precoVenda - precoCompra) AS Lucro_Total
FROM produtos;

SELECT * FROM VEX5;



# 6 Crie uma view que apresente qual o maior pedido em valor

USE loja_online;
CREATE OR REPLACE VIEW VEX6 AS
SELECT MAX(valorTotalPedido) AS Maior_Pedido
FROM pedidos;

SELECT * FROM VEX6;


# 7 Crie uma view que apresente qual o menor pedido em valor

USE loja_online;
CREATE OR REPLACE VIEW VEX7 AS
SELECT MIN(valorTotalPedido) AS Menor_Pedido
FROM pedidos;

SELECT * FROM VEX7;



# 8 Crie uma view que apresente qual o endereco do cliente Teclaudio

USE loja_online;
CREATE OR REPLACE VIEW VEX8 AS
SELECT Logradouro, numero, complemento, bairro, cidade, estado
FROM enderecos
JOIN clientes
ON enderecos.idEndereco = clientes.fk_id_endereco and clientes.nome = 'Tecláudio Screen';

SELECT * FROM VEX8;


# 9 Crie uma view que apresente qual endereco dos clientes que ja fizeram compras

USE loja_online;
CREATE OR REPLACE VIEW VEX9 AS
SELECT Logradouro, numero, complemento, bairro, cidade, estado
FROM enderecos
JOIN clientes
ON enderecos.idEndereco = clientes.fk_id_endereco
JOIN pedidos
ON pedidos.fk_id_Cliente = clientes.idCliente;

SELECT * FROM VEX9;



# 10 Crie uma view que apresente quais pedidos foram pagos em pix

USE loja_online;
CREATE OR REPLACE VIEW VEX10 AS
SELECT idPedido AS Pedidos_PIX
FROM pedidos
JOIN pagamentos
ON pagamentos.idPagamento = pedidos.fk_id_pagamento and pagamentos.forma_pagamento ='PIX';

SELECT * FROM VEX10;



# 11 Crie uma view que apresente quais pedidos foram pagos em cartao

USE loja_online;
CREATE OR REPLACE VIEW VEX11 AS
SELECT idPedido AS Pedidos_CARTAO
FROM pedidos
JOIN pagamentos
ON  pagamentos.idPagamento = pedidos.fk_id_pagamento and pagamentos.forma_pagamento ='CARTAO_CREDITO';

SELECT * FROM VEX11;



# 12 Crie uma view que apresente quais itens foram pedidos no pedido da Marta Castro


#----- * -----


# 13 Crie uma view que apresente qual fornecedor fabricou os produtos da pedido da Helena Carla


#----- * -----


# 14 Crie uma view que apresente qual o nome do fornecedor que fabrica as Camisas comercializadas pela loja

USE loja_online;
CREATE OR REPLACE VIEW VEX14 AS
SELECT DISTINCT nome AS Nome_Fornecedores
FROM fornecedores
JOIN produtos
ON produtos.fk_id_fornecedor = fornecedores.idFornecedor and produtos.descricao LIKE '%Camisa%';

SELECT * FROM VEX14;



# 15 Crie uma view que apresente qual a quantidade em estoque do produto comprado pela Maria de Almeida


#----- * -----


# 16 Crie uma view que apresente o total de produtos fabricados pela Marte Roupas

USE loja_online;
CREATE OR REPLACE VIEW VEX16 AS
SELECT SUM(estoque) AS Estoque_Total
FROM produtos
JOIN fornecedores
ON fornecedores.idFornecedor = produtos.fk_id_fornecedor and fornecedores.nome = 'Marte Roupas';

SELECT * FROM VEX16;


