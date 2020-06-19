create database ExJoinAgreg
go
use ExJoinAgreg

create table Cliente (
	codigo int primary key,
	nome varchar(200),
	endereco varchar(200),
	numero_porta varchar(10),
	telefone varchar(20),
	data_nascimento Date)

create table Fornecedor (
	codigo int primary key,
	nome varchar(150),
	atividade varchar(150),
	telefone varchar(20))

create table Produto(
	codigo int primary key,
	nome varchar(150),
	valor_unitario decimal(7,2),
	quantidade_estoque int,
	descricao varchar(max),
	codigo_fornecedor int,
	foreign key(codigo_fornecedor) references Fornecedor(codigo))

create table Pedido (
	codigo_pedido int,
	codigo_cliente int,
	codigo_produto int,
	quantidade int,
	previsao_entrega Date,
	Constraint pk_Pedido primary key(codigo_pedido, codigo_cliente, codigo_produto),
	foreign key(codigo_cliente) references Cliente(codigo),
	foreign key(codigo_produto) references Produto(codigo))

SELECT ped.codigo_pedido,
	ped.codigo_cliente,
	cli.nome,
	cli.endereco,
	cli.numero_porta,
	cli.telefone,
	ped.previsao_entrega,
	ped.codigo_produto,
	prod.nome as nome_produto,
	prod.valor_unitario,
	ped.quantidade,
	ped.quantidade * prod.valor_unitario as valor_total
FROM Pedido ped inner join Produto prod on prod.codigo = ped.codigo_produto inner join Cliente cli on cli.codigo = ped.codigo_cliente
where ped.codigo_cliente = 33601