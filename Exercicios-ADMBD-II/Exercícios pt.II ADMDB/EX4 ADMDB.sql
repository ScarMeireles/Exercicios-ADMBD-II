CREATE TABLE IF NOT EXISTS LOG(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Select_type varchar(30) NOT NULL,
table_ varchar(30) NOT NULL,
partitions_ varchar(30) NOT NULL,
type_ varchar (30) NOT NULL,
possible_keys_ varchar(30) NOT NULL,
key_ varchar(30) NOT NULL,
key_len varchar(30) NOT NULL,
ref varchar(30) NOT NULL,
rows_  INT NOT NULL,
filtered varchar(30) NOT NULL,
Extra varchar(30) NOT NULL
);

#10 Selects, um desses deve ser Join

explain Select * from clientes where nome = 'Leandro Silva';
explain Select * from enderecos where complemento = 'casa';
explain Select * from enderecos where complemento LIKE 'ap%';
explain Select * from enderecos where bairro = 'CENTRO';
explain Select * from enderecos where cidade = 'BH';
explain Select * from enderecos where estado = 'MG';
explain Select * from itemsvendas where quatidade = '1';
explain Select * from produtos where descricao LIKE 'Memoria%';
explain Select * from produtos where tipo = 'Acessorios';
explain Select * from vendas where dataVenda = '2024-10-09 00:00:00';

Select * from produtos;
#15 índices nas tabelas

alter table clientes add index (nome);
alter table clientes add index (limiteCredito);
alter table clientes add index (email);
alter table clientes add index (cpf);

alter table enderecos add index (complemento);
alter table enderecos add index (bairro);
alter table enderecos add index (cidade);
alter table enderecos add index (estado);
alter table enderecos add index (Lagradouro);
alter table enderecos add index (numero);

alter table itemsvendas add index (quantidade);

alter table produtos add index (descricao);
alter table produtos add index (tipo);
alter table produtos add index (precoVenda);

alter table vendas add index (dataVenda);


