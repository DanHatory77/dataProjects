CREATE TABLE funcionario(
func_id SERIAL NOT NULL PRIMARY KEY,
prim_nome VARCHAR(40),
segun_nome VARCHAR(20),
data_nasc DATE,
data_contrata DATE,
endereco VARCHAR(128),
cidade VARCHAR(30),
estado VARCHAR(30),
resp_para INT,
FOREIGN KEY (resp_para)
REFERENCES funcionario(func_id)
);

drop table funcionario

CREATE TABLE compras(
compra_id SERIAL NOT NULL PRIMARY KEY,
cliente_id INT NOT NULL, 
func_id INT NOT NULL,
preco_total DECIMAL(10,2),
data_compra TIMESTAMP,
data_envio TIMESTAMP,
envio_endereco VARCHAR(60),
envio_cidade VARCHAR(15),
envio_estado VARCHAR(15),
FOREIGN KEY(cliente_id) REFERENCES cliente(cliente_id),
FOREIGN KEY (func_id) REFERENCES funcionario(func_id)
);

CREATE TABLE cliente(
cliente_id SERIAL NOT NULL PRIMARY KEY,
nome_cliente VARCHAR(30),
nome_empresa VARCHAR(40),
email_cliente VARCHAR(128),
endereco_cliente VARCHAR(120),
cidade_cliente VARCHAR(30),
estado_cliente VARCHAR(30)
); 

CREATE TABLE compra_item(
compra_id SERIAL NOT NULL PRIMARY KEY,
produto_id  INT NOT NULL,
preco_unitario DECIMAL(10,2),
qtd INT,
FOREIGN KEY (produto_id)
REFERENCES produto(produto_id)
);

CREATE TABLE produto(
produto_id SERIAL NOT NULL PRIMARY KEY,
produto_nome VARCHAR(40),
categoria_id INT NOT NULL,
qtd_por_unidade INT,
preco_unidade DECIMAL(10,2),
unidades_estoque INT,
prod_descontinuados BOOLEAN,
FOREIGN KEY (categoria_id)
REFERENCES prod_categoria(categoria_id)
);

CREATE TABLE prod_categoria(
categoria_id SERIAL NOT NULL PRIMARY KEY,
categoria_nome VARCHAR(60),
categoria_descri TEXT,
categoria_parente_id INT,
FOREIGN KEY (categoria_parente_id)
REFERENCES prod_categoria(categoria_id)
);


INSERT INTO funcionario (prim_nome, segun_nome, data_nasc, data_contrata, endereco, cidade, estado, resp_para)
VALUES
('João', 'Silva', '1980-05-20', '2005-06-15', 'Rua A, 123', 'Cidade A', 'Estado A', NULL),
('Maria', 'Oliveira', '1985-07-12', '2010-08-25', 'Rua B, 456', 'Cidade B', 'Estado B', 1),
('Carlos', 'Souza', '1979-09-30', '2008-01-10', 'Rua C, 789', 'Cidade C', 'Estado C', 1),
('Ana', 'Costa', '1990-03-05', '2015-05-20', 'Rua D, 321', 'Cidade D', 'Estado D', 2),
('Pedro', 'Gomes', '1982-10-18', '2009-11-30', 'Rua E, 654', 'Cidade E', 'Estado E', 3),
('Julia', 'Martins', '1988-11-22', '2012-12-01', 'Rua F, 987', 'Cidade F', 'Estado F', 2),
('Ricardo', 'Melo', '1975-12-15', '2000-01-25', 'Rua G, 543', 'Cidade G', 'Estado G', NULL),
('Fernanda', 'Alves', '1983-02-28', '2007-03-15', 'Rua H, 876', 'Cidade H', 'Estado H', 7),
('Luiz', 'Ribeiro', '1978-04-10', '2004-05-20', 'Rua I, 210', 'Cidade I', 'Estado I', 1),
('Patricia', 'Lima', '1986-06-25', '2011-07-15', 'Rua J, 432', 'Cidade J', 'Estado J', 2),
('Marcos', 'Ferreira', '1991-08-14', '2016-09-25', 'Rua K, 654', 'Cidade K', 'Estado K', 4),
('Carla', 'Rocha', '1989-10-09', '2013-11-10', 'Rua L, 876', 'Cidade L', 'Estado L', 5),
('Eduardo', 'Barbosa', '1984-12-30', '2006-01-20', 'Rua M, 321', 'Cidade M', 'Estado M', 7),
('Rafaela', 'Santos', '1992-03-01', '2017-04-25', 'Rua N, 543', 'Cidade N', 'Estado N', 6),
('Alex', 'Teixeira', '1981-05-15', '2003-06-15', 'Rua O, 765', 'Cidade O', 'Estado O', 1),
('Tatiana', 'Moura', '1987-07-27', '2012-08-05', 'Rua P, 987', 'Cidade P', 'Estado P', 2),
('Rodrigo', 'Pereira', '1990-09-19', '2015-10-30', 'Rua Q, 109', 'Cidade Q', 'Estado Q', 3),
('Helena', 'Silveira', '1982-11-10', '2009-12-15', 'Rua R, 210', 'Cidade R', 'Estado R', 5),
('Thiago', 'Castro', '1985-01-20', '2010-02-25', 'Rua S, 321', 'Cidade S', 'Estado S', 4),
('Gabriela', 'Macedo', '1988-04-30', '2011-05-10', 'Rua T, 432', 'Cidade T', 'Estado T', 6);


INSERT INTO cliente (nome_cliente, nome_empresa, email_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES
('Carlos Alberto', 'Alberto Tech', 'carlos.alberto@albertotech.com', 'Rua das Flores, 101', 'São Paulo', 'SP'),
('Mariana Silva', 'Silva Solutions', 'mariana.silva@silvasolutions.com', 'Avenida Brasil, 2020', 'Rio de Janeiro', 'RJ'),
('Pedro Santos', 'Santos Consultoria', 'pedro.santos@santosconsultoria.com', 'Rua das Palmeiras, 303', 'Belo Horizonte', 'MG'),
('Fernanda Costa', 'Costa & Associados', 'fernanda.costa@costaassociados.com', 'Rua da Harmonia, 404', 'Curitiba', 'PR'),
('Júlia Pereira', 'Pereira Imports', 'julia.pereira@pereiraimports.com', 'Avenida das Américas, 505', 'Porto Alegre', 'RS'),
('Roberto Lima', 'Lima Logística', 'roberto.lima@limalogistica.com', 'Rua das Acácias, 606', 'Florianópolis', 'SC'),
('Ana Paula', 'Paula Fashion', 'ana.paula@paulafashion.com', 'Rua do Comércio, 707', 'Salvador', 'BA'),
('Bruno Rocha', 'Rocha Construções', 'bruno.rocha@rochaconstrucoes.com', 'Avenida Paulista, 808', 'São Paulo', 'SP'),
('Carla Mendes', 'Mendes Consultoria', 'carla.mendes@mendesconsultoria.com', 'Rua dos Pinheiros, 909', 'Fortaleza', 'CE'),
('Felipe Almeida', 'Almeida Engenharia', 'felipe.almeida@almeidaengenharia.com', 'Avenida Central, 1010', 'Brasília', 'DF'),
('Gabriela Souza', 'Souza Marketing', 'gabriela.souza@souzamarketing.com', 'Rua das Laranjeiras, 111', 'Recife', 'PE'),
('Leonardo Teixeira', 'Teixeira Advocacia', 'leonardo.teixeira@teixeiraadvocacia.com', 'Avenida Atlântica, 212', 'Rio de Janeiro', 'RJ'),
('Marina Ribeiro', 'Ribeiro Design', 'marina.ribeiro@ribeirodesign.com', 'Rua das Mangueiras, 313', 'Vitória', 'ES'),
('Rafael Gonçalves', 'Gonçalves Tech', 'rafael.goncalves@goncalvestech.com', 'Avenida do Contorno, 414', 'Belo Horizonte', 'MG'),
('Lucas Oliveira', 'Oliveira Soluções', 'lucas.oliveira@oliveirasolucoes.com', 'Rua dos Ipês, 515', 'Campinas', 'SP'),
('Patrícia Fernandes', 'Fernandes Arquitetura', 'patricia.fernandes@fernandesarquitetura.com', 'Avenida Independência, 616', 'Porto Alegre', 'RS'),
('Ricardo Batista', 'Batista Telecom', 'ricardo.batista@batistatelecom.com', 'Rua das Rosas, 717', 'Curitiba', 'PR'),
('Isabela Martins', 'Martins Eventos', 'isabela.martins@martinseventos.com', 'Avenida dos Andradas, 818', 'Belo Horizonte', 'MG'),
('Eduardo Ferreira', 'Ferreira Transportes', 'eduardo.ferreira@ferreiratransportes.com', 'Rua dos Jasmins, 919', 'São Luís', 'MA'),
('Sofia Barbosa', 'Barbosa Finance', 'sofia.barbosa@barbosafinance.com', 'Avenida das Nações, 1020', 'Porto Velho', 'RO');



INSERT INTO prod_categoria (categoria_nome, categoria_descri, categoria_parente_id)
VALUES
('Eletrônicos', 'Produtos eletrônicos diversos', NULL),
('Roupas', 'Diversos tipos de roupas', NULL),
('Informática', 'Produtos relacionados a computadores e tecnologia', 1),
('Calçados', 'Calçados para diferentes ocasiões', 2),
('Acessórios', 'Acessórios diversos para uso pessoal', 2);


INSERT INTO produto (produto_nome, categoria_id, qtd_por_unidade, preco_unidade, unidades_estoque, prod_descontinuados)
VALUES
('Produto A', 1, 10, 15.00, 100, FALSE),
('Produto B', 2, 20, 25.50, 150, FALSE),
('Produto C', 3, 30, 35.75, 200, FALSE),
('Produto D', 4, 40, 45.00, 250, TRUE),
('Produto E', 5, 50, 55.25, 300, FALSE),
('Produto F', 1, 15, 20.00, 120, FALSE),
('Produto G', 2, 25, 30.50, 140, TRUE),
('Produto H', 3, 35, 40.75, 160, FALSE),
('Produto I', 4, 45, 50.00, 180, TRUE),
('Produto J', 5, 55, 60.25, 200, FALSE),
('Produto K', 1, 12, 22.00, 110, FALSE),
('Produto L', 2, 22, 32.50, 130, FALSE),
('Produto M', 3, 32, 42.75, 170, TRUE),
('Produto N', 4, 42, 52.00, 190, FALSE),
('Produto O', 5, 52, 62.25, 210, TRUE),
('Produto P', 1, 14, 24.00, 125, FALSE),
('Produto Q', 2, 24, 34.50, 135, FALSE),
('Produto R', 3, 34, 44.75, 175, TRUE),
('Produto S', 4, 44, 54.00, 195, FALSE),
('Produto T', 5, 54, 64.25, 215, TRUE);



INSERT INTO compras (cliente_id, func_id, preco_total, data_compra, data_envio, envio_endereco, envio_cidade, envio_estado)
VALUES
(1, 1, 150.75, '2024-01-15 10:30:00', '2024-01-20 14:00:00', 'Rua A, 123', 'Cidade A', 'Estado A'),
(2, 2, 250.00, '2024-02-17 11:45:00', '2024-02-22 16:30:00', 'Rua B, 456', 'Cidade B', 'Estado B'),
(3, 3, 325.50, '2024-03-20 09:15:00', '2024-03-25 12:00:00', 'Rua C, 789', 'Cidade C', 'Estado C'),
(4, 4, 410.75, '2024-04-25 14:20:00', '2024-04-30 15:00:00', 'Rua D, 321', 'Cidade D', 'Estado D'),
(5, 5, 510.00, '2024-05-30 13:30:00', '2024-06-04 17:00:00', 'Rua E, 654', 'Cidade E', 'Estado E'),
(6, 6, 275.25, '2024-06-05 16:45:00', '2024-06-10 18:30:00', 'Rua F, 987', 'Cidade F', 'Estado F'),
(7, 7, 320.00, '2024-07-10 10:30:00', '2024-07-15 12:30:00', 'Rua G, 543', 'Cidade G', 'Estado G'),
(8, 8, 150.00, '2024-08-15 09:45:00', '2024-08-20 14:00:00', 'Rua H, 876', 'Cidade H', 'Estado H'),
(9, 9, 420.00, '2024-09-20 08:15:00', '2024-09-25 16:00:00', 'Rua I, 210', 'Cidade I', 'Estado I'),
(10, 10, 530.50, '2024-10-25 15:45:00', '2024-10-30 18:00:00', 'Rua J, 432', 'Cidade J', 'Estado J'),
(1, 2, 140.25, '2024-11-05 14:00:00', '2024-11-10 13:30:00', 'Rua K, 654', 'Cidade K', 'Estado K'),
(2, 3, 230.75, '2024-12-10 13:15:00', '2024-12-15 11:30:00', 'Rua L, 876', 'Cidade L', 'Estado L'),
(3, 4, 310.00, '2024-11-15 12:30:00', '2024-11-20 10:00:00', 'Rua M, 321', 'Cidade M', 'Estado M'),
(4, 5, 480.50, '2024-12-20 11:45:00', '2024-12-25 14:30:00', 'Rua N, 543', 'Cidade N', 'Estado N'),
(5, 6, 120.75, '2024-01-25 10:00:00', '2024-01-30 12:00:00', 'Rua O, 765', 'Cidade O', 'Estado O'),
(6, 7, 215.00, '2024-02-20 09:30:00', '2024-02-25 15:00:00', 'Rua P, 987', 'Cidade P', 'Estado P'),
(7, 8, 350.25, '2024-03-15 08:15:00', '2024-03-20 16:30:00', 'Rua Q, 109', 'Cidade Q', 'Estado Q'),
(8, 9, 410.00, '2024-04-10 07:45:00', '2024-04-15 18:00:00', 'Rua R, 210', 'Cidade R', 'Estado R'),
(9, 10, 220.50, '2024-05-05 16:00:00', '2024-05-10 13:00:00', 'Rua S, 321', 'Cidade S', 'Estado S'),
(10, 1, 305.00, '2024-06-15 15:30:00', '2024-06-20 17:30:00', 'Rua T, 432', 'Cidade T', 'Estado T');


INSERT INTO compra_item (produto_id, preco_unitario, qtd)
VALUES
(1, 10.50, 5),
(2, 20.75, 3),
(3, 15.00, 2),
(4, 30.00, 1),
(5, 25.50, 4),
(6, 10.00, 7),
(7, 12.75, 6),
(8, 22.00, 8),
(9, 18.50, 3),
(10, 35.00, 2),
(1, 10.50, 4),
(2, 20.75, 5),
(3, 15.00, 3),
(4, 30.00, 2),
(5, 25.50, 1),
(6, 10.00, 9),
(7, 12.75, 8),
(8, 22.00, 4),
(9, 18.50, 7),
(10, 35.00, 6);


Query 1: Mostrar todos os itens na tabela de produtos
SELECT * FROM produto

Query 2: Mostrar nomes dos produtos que tenham o preço igual ou maior que 3.
SELECT * FROM produto
WHERE preco_unidade >= 3.5

Query 3: Mostrar todos os produtos da categoria 1 ou 5 com o preço acima de 3.5.
SELECT * FROM produto
WHERE categoria_id = 1 OR categoria_id = 5
AND preco_unidade > 3.5

Query 4: Mostrar os nomes dos produtos e suas respectivas categorias.
SELECT produto_nome, prod_categoria.categoria_nome AS cat_nome FROM produto
JOIN prod_categoria ON produto.categoria_id = prod_categoria.categoria_id

Query 5: Mostre o id da compra, o nome dos produtos, preço unitario, hora da compra e quantidade de produtos comprados.
SELECT
  compra_id,
  produto_nome,
  compra_item.preco_unitario,
  qtd
FROM compra_item
JOIN produto
  ON compra_item.produto_id = produto.produto_id;

Query 6:Para cada compra, mostre as categorias dos produtos comprados.
SELECT DISTINCT
  compra_id,
  categoria_nome AS categoria_nome
FROM compra_item
JOIN produto
  ON compra_item.compra_id = compra_item.produto_id
JOIN prod_categoria
  ON produto.categoria_id = prod_categoria.categoria_id;

Query 7: Mostre todas as categorias. Organisando-as em ordem alfabetica.
SELECT * FROM prod_categoria
ORDER BY categoria_nome ASC;

Query 8: Mostre os nomes, sobrenomes e aniversarios em ordem ascendente.
SELECT prim_nome, segun_nome, data_nasc FROM funcionario
ORDER BY data_nasc DESC;

Query 9:Mostre os produtos cadastrados organizando as quantidades em ordem descendente e os seus nomes em ordem ascendente.
SELECT * FROM produto
ORDER BY qtd_por_unidade DESC, produto_nome ASC;

Query 10: Para cada categoria de produto, mostre o seu nome e a media de preço unitário.
SELECT prod_categoria.categoria_nome AS media_preco FROM produto
JOIN prod_categoria ON produto.categoria_id = prod_categoria.categoria_id
GROUP BY prod_categoria.categoria_nome;

Query 11: Conte quantos cliente vivem em cada cidade exceto São Paulo e Rio de Janeiro.
Organize o resultado em duas colunas, cidade e qdt_clientes em ordem ascendente.
SELECT
  cidade_cliente,
  COUNT(cliente_id) AS qtd_clientes
FROM cliente
WHERE cidade_cliente <> 'São Paulo'
  AND cidade_cliente <> 'Rio de Janeiro'
GROUP BY cidade_cliente
ORDER BY cidade_cliente ASC;

Query 12:Para cada categoria, encontre o numero de produtos descontinuados. Mostre apenas as categorias com mais de 3 produtos descontinuados.
SELECT
  prod_categoria.categoria_nome,
  COUNT(produto_id) AS num_produto_descontinuado
FROM produto
JOIN prod_categoria
  ON produto.categoria_id =  prod_categoria.categoria_id
WHERE prod_descontinuados IS TRUE
GROUP BY  prod_categoria.categoria_nome
HAVING COUNT(produto_id) >= 3
ORDER BY COUNT(produto_id) DESC;

Query 13:
Mostre os nomes dos empregados que não tem data de contratação.
SELECT prim_nome,segun_nome FROM funcionario
WHERE data_contrata IS NULL;

Query 14:
Conte quantos funcionarios não tem data de nascimento nem data de contratação cadastrada.
SELECT
  COUNT(*) AS func_data
FROM funcionario
WHERE data_nasc IS NULL
  AND data_contrata IS NULL;

 Query 15:
 Mostre a porcentagem da quantidade de dinheiro que cada cliente gastou comparando com a quantidade de dinherio que ele gastou no total.
 SELECT
  nome_cliente,
  compra_id,
  ROUND(preco_total * 100.0 / (SELECT SUM(preco_total) FROM compras WHERE cliente_id = c.cliente_id)) AS porcento
FROM compras c
JOIN cliente
  ON c.cliente_id = cliente.cliente_id;