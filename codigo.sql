CREATE DATABASE Vendas;
-- Criação o banco de dados
CREATE TABLE regiao (
    idRegiao INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255)
);
CREATE TABLE veiculo (
    idVeiculo INT IDENTITY(1,1) PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    placa VARCHAR(255)
);
CREATE TABLE produto (
    idProduto INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255),
    preco FLOAT,
    estoque INT,
    ativo BIT
);
CREATE TABLE cliente (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(255)
);
CREATE TABLE ponto_estrategico (
    idPontoEst INT IDENTITY(1,1) PRIMARY KEY,
    idRegiao INT FOREIGN KEY REFERENCES regiao(idRegiao),
    endereco VARCHAR(255),
    cep VARCHAR(255)
);
CREATE TABLE vendedor (
	idVendedor INT IDENTITY(1,1) PRIMARY KEY,
	idRegiao INT FOREIGN KEY REFERENCES regiao(idRegiao),
	idVeiculo INT FOREIGN KEY REFERENCES veiculo(idVeiculo),
	nome VARCHAR(255)
);
CREATE TABLE nota_fiscal (
	idNotaFis INT IDENTITY(1,1) PRIMARY KEY,
	idCliente INT FOREIGN KEY REFERENCES cliente(idCliente),
	idVendedor INT FOREIGN KEY REFERENCES vendedor(idVendedor)
);
CREATE TABLE pedido (
	idPedido INT IDENTITY(1,1) PRIMARY KEY,
	idNotaFis INT FOREIGN KEY REFERENCES nota_fiscal(idNotaFis),
	idProduto INT FOREIGN KEY REFERENCES produto(idProduto),
	quantidade INT
);
-- Criação de todas as tabelas do banco
INSERT INTO regiao(nome)
VALUES ('Zona Leste'), ('Zona Sul'), ('Centro');
INSERT INTO veiculo(marca, modelo, placa)
VALUES ('SSC', 'Tuatara', 'FIV6373'),
	('Koenigsegg', 'Agera RS', 'FYE7834'),
	('Bugatti', 'Chiron Super Sport 300+', 'CBP8158'),
	('Bugatti', 'Chiron 2020', 'EWH1457'),
	('McLaren', 'Speedtail 2021', 'CZT3223'),
	('Lamborghini', 'Aventador SVJ', 'FLK4924'),
	('Ford', 'GT 2020', 'EJN0897'),
	('McLaren', '720S 2020', 'CBR9194'),
	('Ferrari', '812 Superfast 2020', 'DAB3506'),
	('Aston Martin', 'DBS Superleggera 2020', 'FUF5011');
INSERT INTO produto(nome, preco, estoque, ativo)
VALUES ('Super Antipulgas Simparic 20-40 kg 3 comprimidos', 25.00, 12, 1),
	('Caixa De Transporte Para Gatos Coelho Cão Pequeno Nº1 8kg', 21.43, 194, 1),
	('tapete higiênico lavavel reutilizavel pipi home o queridinho mega promoção de inauguração', 13.00, 750, 1),
	('Luva Tira Pelos Nano Magnética Escova Pets Cães & Gatos', 6.99, 526, 0),
	('Sanitario canino xixi dog promoção', 19.90, 6800, 0),
	('Comedouro Bebedouro Melanina 450ML Para Pet Cachorro e Gato Porte Médio E Pequeno', 3.00, 490, 0),
	('Cobertor PET - Coberta para Cachorros, Gatos, Cães - Manta Fofinha', 14.26, 4200, 1);
INSERT INTO cliente(nome, cpf)
VALUES ('Gabriela Emily Andreia Farias', '664.523.798-79'),
	('Pietro Ryan da Luz', '598.233.068-00'),
	('Heitor Yuri Lorenzo Dias', '667.934.408-53'),
	('Cauã Yuri Brito', '774.929.098-29'),
	('Levi Murilo da Cruz', '884.620.738-94');
INSERT INTO ponto_estrategico(idRegiao, endereco, cep)
VALUES (1, 'Travessa Tina Modotti', '03386-185'),
	(2, 'Rua Itumirim', '03941-050'),
	(3, 'Rua Afonso de Freitas 550', '04006-907'),
	(1, 'Rua Aquiles Stengel', '03278-140'),
	(2, 'Rua Vitória Concarini', '08031-410'),
	(3, 'Rua Clemente Faria', '02680-031'),
	(1, 'Rua Duarte Teixeira Chaves', '08390-410'),
	(2, 'Rua das Traíras', '04473-150'),
	(3, 'Rua Sylvio Pesseti', '03912-310');
INSERT INTO vendedor(idRegiao, idVeiculo, nome)
VALUES (1, 1, 'Davi Lucas da Paz'),
	(2, 2, 'Oliver Levi Yago Corte Real'),
	(3, 3, 'Yasmin Lívia Araújo'),
	(1, 4, 'Rita Luana Isabela Nascimento'),
	(2, 5, 'Pietra Emanuelly Maria Moura'),
	(3, 6, 'Arthur Marcelo Diogo Pinto'),
	(1, 7, 'Emanuel Giovanni Cavalcanti'),
	(2, 8, 'Benício Davi Anderson Castro'),
	(3, 9, 'Leandro Heitor Rocha');
INSERT INTO nota_fiscal (idCliente, idVendedor)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
INSERT INTO pedido(idNotaFis, idProduto, quantidade)
VALUES (1, 1, 8), (2, 2, 13), (3, 3, 4), (4, 4, 6), (5, 5, 15);
-- Inserção de dados em todas as tabelas
SELECT nota_fiscal.idCliente, nota_fiscal.idNotaFis, vendedor.nome FROM nota_fiscal INNER JOIN vendedor ON nota_fiscal.idVendedor = vendedor.idVendedor;
SELECT modelo FROM veiculo;
SELECT nome FROM vendedores WHERE EXISTS(SELECT modelo FROM veiculo WHERE idVeiculo < 3);
-- Consultas de dados das tabelas
