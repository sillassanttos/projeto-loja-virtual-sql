create database lojavirtual;

use lojavirtual;

/* relacionamento Um para Um
 * 
 * 
 *   tb_produtos
 *   tb_descricoes_tecnicas
 * 
 *  */

create table tb_produtos(
	id_produto int not null primary key auto_increment,
	produto varchar(200) not null,
	valor float(8,2) not null default 0
);

create table tb_descricoes_tecnicas(
	id_descricao_tecnica int not null primary key auto_increment,
	id_produto int not null,
	descricao_tecnica text not null,
	foreign key(id_produto) references tb_produtos(id_produto)
);

INSERT INTO tb_produtos(produto, valor) VALUES ('Notebook Dell Inspiron Ultrafino Intel Core i7, 16GB RAM e 240GB SSD', 3500.00);
INSERT INTO tb_produtos(produto, valor) VALUES ('Smart TV LED 40" Samsung Full HD 2 HDMI 1 USB Wi-Fi Integrado', 1475.54);
INSERT INTO tb_produtos(produto, valor) VALUES ('Smartphone LG K10 Dual Chip Android 7.0 4G Wi-Fi Câmera de 13MP', 629.99);

INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (1, 'O novo Inspiron Dell oferece um design elegante e tela infinita que amplia seus sentidos, mantendo a sofisticação e medidas compactas...');
INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (2, 'A smart TV da Samsung possui tela de 40" e oferece resolução Full HD, imagens duas vezes melhores que TVs HDs padrão...');
INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (3, 'Saia da mesmice. O smartphone LG está mais divertido, rápido, fácil, cheio de selfies e com tela HD de incríveis 5,3"...');

/* Relacionamento de Um para Muitos
 * 
 * 	 tb_imagens
 *   
 *  */
create table tb_imagens(
	id_imagem int not null primary key auto_increment,
	id_produto int not null,
	url_imagem varchar(200) not null,
	foreign key(id_produto) references tb_produtos(id_produto)
);

INSERT INTO tb_imagens(id_produto, url_imagem) VALUES (1, 'notebook_1.jpg'), (1, 'notebook_2.jpg'), (1, 'notebook_3.jpg');
INSERT INTO tb_imagens(id_produto, url_imagem) VALUES (2, 'smarttv_1.jpg'), (2, 'smarttv_2.jpg');
INSERT INTO tb_imagens(id_produto, url_imagem) VALUES (3, 'smartphone_1.jpg');


/* Relacionamento Muitoas para Muitos 
 * 
 *   tb_clietes
 *   tb_pedidos
 *   tb_pedidos_produtos
 * 
 * */
create table tb_clientes(
	id_cliente int not null primary key auto_increment,
	nome varchar(100) not null,
	idade int(3) not null
);

create table tb_pedidos(
	id_pedido int not null primary key auto_increment,
	id_cliente int not null,
	data_hora datetime not null default current_timestamp,
	foreign key(id_cliente) references tb_clientes(id_cliente)
);

create table tb_pedidos_produtos(
	id_pedido int not null,
	id_produto int not null,
	foreign key(id_pedido) references tb_pedidos(id_pedido),
	foreign key(id_produto) references tb_produtos(id_produto)
);

INSERT INTO tb_clientes(nome, idade) VALUES('Jorge', 29);	
INSERT INTO tb_pedidos(id_cliente) VALUES(1);	
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(1, 2);
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(1, 3);
INSERT INTO tb_pedidos(id_cliente) VALUES(1);
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(2,3);
INSERT INTO tb_clientes(nome, idade) VALUES('Jamilton', 30);
INSERT INTO tb_pedidos(id_cliente) VALUES(2);
INSERT INTO tb_pedidos_produtos(id_pedido, id_produto) VALUES(3,1);


INSERT INTO tb_clientes(nome, idade) VALUES('João', 30);
INSERT INTO tb_clientes(nome, idade) VALUES('Maria', 45);
INSERT INTO tb_clientes(nome, idade) VALUES('Fernanda', 21);
INSERT INTO tb_clientes(nome, idade) VALUES('Marcos', 32);
INSERT INTO tb_clientes(nome, idade) VALUES('Gustavo', 16);
INSERT INTO tb_clientes(nome, idade) VALUES('Laura', 25);
INSERT INTO tb_clientes(nome, idade) VALUES('Rosa', 27);
INSERT INTO tb_clientes(nome, idade) VALUES('Aline', 23);
INSERT INTO tb_clientes(nome, idade) VALUES('Talita', 25);

/* LEFT JOIN */
select *
  from tb_clientes c
  left
  join tb_pedidos p
    on (c.id_cliente = p.id_cliente) 

select *
  from tb_produtos p
  left 
  join tb_imagens i
    on (p.id_produto = i.id_produto)

    
/* RIGHT JOIN */  
select *
  from tb_clientes c
 right
  join tb_pedidos p
    on (p.id_cliente = c.id_cliente) 

