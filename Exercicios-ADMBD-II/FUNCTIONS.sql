-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/09/2024 às 18:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_online`
--

DELIMITER $$
--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `EX1` () RETURNS VARCHAR(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
RETURN(SELECT nome FROM Fornecedores WHERE nome LIKE '$S');

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `EX2` (`retira` VARCHAR(500)) RETURNS VARCHAR(500) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
RETURN (REPLACE(REPLACE(REPLACE(REPLACE(retira, '*', ''), '.', ''), '-', ''), '!', ''));

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `EX3` (`VAL1` INT, `VAL2` INT, `VAL3` INT) RETURNS INT(11) DETERMINISTIC BEGIN
DECLARE MEDIA INT;
SET MEDIA = (VAL1 + VAL2 + VAL3)/3;
RETURN(MEDIA);

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `EX5` (`texto` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
SET texto =(REVERSE(texto));
RETURN texto;

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `EX6` () RETURNS DOUBLE  BEGIN

DECLARE aux, resultado double;
SELECT valorTotalPedido INTO aux FROM pedidos AS Valor_de_Venda;
SET resultado = aux * 0.9;
RETURN resultado;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `limiteCredito` double NOT NULL,
  `fk_id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nome`, `email`, `cpf`, `telefone`, `limiteCredito`, `fk_id_endereco`) VALUES
(1, 'Marta Castro', 'mcastro@gmail.com', '68637571255', '3193324422', 4000, 1),
(2, 'Maria de Almeida', 'almeidam@gmail.com', '14496682320', '31972344312', 4500, 2),
(3, 'Helena Carla', 'hcarla2@gmail.com', '44637478723', '31932422121', 5000, 3),
(4, 'Jorge Mario', 'jmjm@gmail.com', '81262962323', '31909877678', 5000, 4),
(5, 'Tecláudio Screen', 'teclas@gmail.com', '87181183052', '31952133212', 8000, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `idEndereco` int(11) NOT NULL,
  `Logradouro` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `cep` int(11) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`idEndereco`, `Logradouro`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `estado`) VALUES
(1, 'Rua das flores', 1223, 'Ap 102', 31222255, 'Centro', 'Belo horizonte', 'Mg'),
(2, 'Av das Palmeiras', 13, 'Ap 202', 39452275, 'Centro', 'Belo horizonte', 'Mg'),
(3, 'Rua Centro Alto', 45, 'Galpao 3', 2122299, 'Londres', 'Betim', 'Mg'),
(4, 'Av das Naçoes', 988, 'Loja3', 45343434, 'Centro', 'Contagem', 'Mg'),
(5, 'Rua Florentina', 88, 'Ap 301', 319090988, 'Alto Vera', 'Sao Paulo', 'Sp'),
(6, 'Av Vargem Grande', 345, 'Q10', 66643434, 'Marcondes', 'Salvador', 'Ba'),
(7, 'Av das Graças', 188, 'Loja12', 42323456, 'Centro', 'Rio de Janeiro', 'Mg'),
(8, 'Rua dos Lobos', 77, 'AP1002', 51232322, 'Centro', 'Sao Paulo', 'Sp'),
(9, 'Av Nacional', 128, 'Galpão 09', 56444342, 'Centro', 'Contagem', 'Mg'),
(10, 'Av Miami', 453, 'Loja10', 45345431, 'Centro', 'Belo Horizonte', 'Mg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `idFornecedor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` bigint(20) NOT NULL,
  `inscE` bigint(20) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fk_id_Endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`idFornecedor`, `nome`, `cnpj`, `inscE`, `telefone`, `email`, `fk_id_Endereco`) VALUES
(1, 'Marte Roupas', 2332222230001, 1234323296, '31983233234', 'mr@gmail.com', 6),
(2, 'Bolas Brasil', 9850339290002, 3662282950, '31987654443', 'bolasb@hotmail.com', 7),
(3, 'Calcados Mart', 3432222220001, 1142167976, '31978900987', 'calcmart@gmail.com', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemspedidos`
--

CREATE TABLE `itemspedidos` (
  `idiItemPedido` int(11) NOT NULL,
  `fk_id_Pedido` int(11) NOT NULL,
  `fk_id_Produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itemspedidos`
--

INSERT INTO `itemspedidos` (`idiItemPedido`, `fk_id_Pedido`, `fk_id_Produto`, `quantidade`) VALUES
(1, 1, 1, 1),
(2, 2, 15, 2),
(3, 3, 5, 1),
(4, 3, 10, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `idPagamento` int(11) NOT NULL,
  `forma_pagamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamentos`
--

INSERT INTO `pagamentos` (`idPagamento`, `forma_pagamento`) VALUES
(1, 'PIX'),
(2, 'CARTAO_CREDITO'),
(3, 'BOLETO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `fk_id_Cliente` int(11) NOT NULL,
  `fk_id_pagamento` int(11) NOT NULL,
  `dataped` date NOT NULL,
  `valorTotalPedido` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `fk_id_Cliente`, `fk_id_pagamento`, `dataped`, `valorTotalPedido`) VALUES
(1, 1, 1, '2024-08-21', 149.9),
(2, 2, 1, '2024-08-21', 298.4),
(3, 3, 1, '2024-08-21', 599.8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProduto` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `precoCompra` double NOT NULL,
  `precoVenda` double NOT NULL,
  `estoque` int(11) NOT NULL,
  `fk_id_fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`idProduto`, `descricao`, `tipo`, `precoCompra`, `precoVenda`, `estoque`, `fk_id_fornecedor`) VALUES
(1, 'Camisa Nike p101', 'Roupa', 79.9, 149.9, 10, 1),
(2, 'Camisa Nike m201', 'Roupa', 89.9, 159.9, 20, 1),
(3, 'Camisa Adidas mA90', 'Roupa', 99.9, 189.9, 1, 1),
(4, 'Camisa Adidas gA80', 'Roupa', 109.9, 199.9, 5, 1),
(5, 'Tênis Nike Air n33', 'Calçado', 179.9, 349.9, 23, 3),
(6, 'Tênis Nike Air n42', 'Calçado', 210.8, 389.3, 25, 3),
(7, 'Tênis Nike Air n39', 'Calçado', 129.5, 299.9, 15, 3),
(8, 'Tênis Adidas Topz n34', 'Calçado', 279.5, 549.9, 5, 3),
(9, 'Tênis Adidas Topz n38', 'Calçado', 299.9, 589.9, 10, 3),
(10, 'Bola Adidas Campo', 'Bola', 179.9, 249.9, 23, 2),
(11, 'Bola Nike Basquete', 'Bola', 110.8, 289.3, 25, 2),
(12, 'Bola Nike Futsal', 'Bola', 129.5, 239.9, 15, 2),
(13, 'Peso 5k Andoid', 'Peso', 59.5, 139.9, 5, 2),
(14, 'Peso 4k Legace', 'Peso', 50.9, 139.9, 10, 2),
(15, 'Peso 6k Legace', 'Peso', 69.5, 149.2, 17, 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex1`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex1` (
`NUMERO_PEDIDOS` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex2`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex2` (
`Todos_Pedidos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex3`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex3` (
`nome` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex4`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex4` (
`idProduto` int(11)
,`descricao` varchar(100)
,`tipo` varchar(50)
,`dataped` date
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex5`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex5` (
`descricao` varchar(100)
,`precoVenda` double
,`precoCompra` double
,`Lucro_Total` double
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex6`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex6` (
`Maior_Pedido` double
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex7`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex7` (
`Menor_Pedido` double
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex8`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex8` (
`Logradouro` varchar(100)
,`numero` int(11)
,`complemento` varchar(100)
,`bairro` varchar(30)
,`cidade` varchar(30)
,`estado` varchar(3)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex9`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex9` (
`Logradouro` varchar(100)
,`numero` int(11)
,`complemento` varchar(100)
,`bairro` varchar(30)
,`cidade` varchar(30)
,`estado` varchar(3)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex10`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex10` (
`Pedidos_PIX` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex11`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex11` (
`Pedidos_CARTAO` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex12`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex12` (
`descricao_produtos_pedidos` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex13`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex13` (
`Nome_Fornecedores` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex14`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex14` (
`Nome_Fornecedores` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vex16`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vex16` (
`Estoque_Total` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vex1`
--
DROP TABLE IF EXISTS `vex1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex1`  AS SELECT count(`pedidos`.`idPedido`) AS `NUMERO_PEDIDOS` FROM `pedidos` WHERE `pedidos`.`dataped` = '2024/08/21' ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex2`
--
DROP TABLE IF EXISTS `vex2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex2`  AS SELECT count(`pedidos`.`idPedido`) AS `Todos_Pedidos` FROM `pedidos` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex3`
--
DROP TABLE IF EXISTS `vex3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex3`  AS SELECT `c`.`nome` AS `nome` FROM (`clientes` `c` join `pedidos` `p` on(`c`.`idCliente` = `p`.`fk_id_Cliente`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex4`
--
DROP TABLE IF EXISTS `vex4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex4`  AS SELECT `pro`.`idProduto` AS `idProduto`, `pro`.`descricao` AS `descricao`, `pro`.`tipo` AS `tipo`, `ped`.`dataped` AS `dataped` FROM ((`pedidos` `ped` join `itemspedidos` `itped` on(`ped`.`idPedido` = `itped`.`fk_id_Pedido`)) join `produtos` `pro` on(`itped`.`fk_id_Produto` = `pro`.`idProduto`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex5`
--
DROP TABLE IF EXISTS `vex5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex5`  AS SELECT `produtos`.`descricao` AS `descricao`, `produtos`.`precoVenda` AS `precoVenda`, `produtos`.`precoCompra` AS `precoCompra`, `produtos`.`precoVenda`- `produtos`.`precoCompra` AS `Lucro_Total` FROM `produtos` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex6`
--
DROP TABLE IF EXISTS `vex6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex6`  AS SELECT max(`pedidos`.`valorTotalPedido`) AS `Maior_Pedido` FROM `pedidos` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex7`
--
DROP TABLE IF EXISTS `vex7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex7`  AS SELECT min(`pedidos`.`valorTotalPedido`) AS `Menor_Pedido` FROM `pedidos` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex8`
--
DROP TABLE IF EXISTS `vex8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex8`  AS SELECT `enderecos`.`Logradouro` AS `Logradouro`, `enderecos`.`numero` AS `numero`, `enderecos`.`complemento` AS `complemento`, `enderecos`.`bairro` AS `bairro`, `enderecos`.`cidade` AS `cidade`, `enderecos`.`estado` AS `estado` FROM (`enderecos` join `clientes` on(`enderecos`.`idEndereco` = `clientes`.`fk_id_endereco` and `clientes`.`nome` = 'Tecláudio Screen')) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex9`
--
DROP TABLE IF EXISTS `vex9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex9`  AS SELECT `enderecos`.`Logradouro` AS `Logradouro`, `enderecos`.`numero` AS `numero`, `enderecos`.`complemento` AS `complemento`, `enderecos`.`bairro` AS `bairro`, `enderecos`.`cidade` AS `cidade`, `enderecos`.`estado` AS `estado` FROM ((`enderecos` join `clientes` on(`enderecos`.`idEndereco` = `clientes`.`fk_id_endereco`)) join `pedidos` on(`pedidos`.`fk_id_Cliente` = `clientes`.`idCliente`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex10`
--
DROP TABLE IF EXISTS `vex10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex10`  AS SELECT `pedidos`.`idPedido` AS `Pedidos_PIX` FROM (`pedidos` join `pagamentos` on(`pagamentos`.`idPagamento` = `pedidos`.`fk_id_pagamento` and `pagamentos`.`forma_pagamento` = 'PIX')) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex11`
--
DROP TABLE IF EXISTS `vex11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex11`  AS SELECT `pedidos`.`idPedido` AS `Pedidos_CARTAO` FROM (`pedidos` join `pagamentos` on(`pagamentos`.`idPagamento` = `pedidos`.`fk_id_pagamento` and `pagamentos`.`forma_pagamento` = 'CARTAO_CREDITO')) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex12`
--
DROP TABLE IF EXISTS `vex12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex12`  AS SELECT `produtos`.`descricao` AS `descricao_produtos_pedidos` FROM (`produtos` join `clientes` on(`clientes`.`nome` = 'Marta Castro')) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex13`
--
DROP TABLE IF EXISTS `vex13`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex13`  AS SELECT `fornecedores`.`nome` AS `Nome_Fornecedores` FROM `fornecedores` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex14`
--
DROP TABLE IF EXISTS `vex14`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex14`  AS SELECT DISTINCT `fornecedores`.`nome` AS `Nome_Fornecedores` FROM (`fornecedores` join `produtos` on(`produtos`.`fk_id_fornecedor` = `fornecedores`.`idFornecedor` and `produtos`.`descricao` like '%Camisa%')) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vex16`
--
DROP TABLE IF EXISTS `vex16`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vex16`  AS SELECT sum(`produtos`.`estoque`) AS `Estoque_Total` FROM (`produtos` join `fornecedores` on(`fornecedores`.`idFornecedor` = `produtos`.`fk_id_fornecedor` and `fornecedores`.`nome` = 'Marte Roupas')) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_id_endereco` (`fk_id_endereco`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`idFornecedor`);

--
-- Índices de tabela `itemspedidos`
--
ALTER TABLE `itemspedidos`
  ADD PRIMARY KEY (`idiItemPedido`),
  ADD KEY `itemspedidos_ibfk_1` (`fk_id_Pedido`),
  ADD KEY `itemspedidos_ibfk_2` (`fk_id_Produto`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`idPagamento`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_id_pagamento` (`fk_id_pagamento`),
  ADD KEY `fk_id_Cliente` (`fk_id_Cliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `fk_id_fornecedor` (`fk_id_fornecedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `itemspedidos`
--
ALTER TABLE `itemspedidos`
  MODIFY `idiItemPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `idPagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`fk_id_endereco`) REFERENCES `enderecos` (`idEndereco`);

--
-- Restrições para tabelas `itemspedidos`
--
ALTER TABLE `itemspedidos`
  ADD CONSTRAINT `itemspedidos_ibfk_1` FOREIGN KEY (`fk_id_Pedido`) REFERENCES `pedidos` (`idPedido`),
  ADD CONSTRAINT `itemspedidos_ibfk_2` FOREIGN KEY (`fk_id_Produto`) REFERENCES `produtos` (`idProduto`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`fk_id_pagamento`) REFERENCES `pagamentos` (`idPagamento`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`fk_id_Cliente`) REFERENCES `clientes` (`idCliente`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`fk_id_fornecedor`) REFERENCES `fornecedores` (`idFornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
