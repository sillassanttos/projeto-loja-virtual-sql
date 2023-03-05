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
INSERT INTO tb_produtos(produto, valor) VALUES ('Smartphone LG K10 Dual Chip Android 7.0 4G Wi-Fi C�mera de 13MP', 629.99);

INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (1, 'O novo Inspiron Dell oferece um design elegante e tela infinita que amplia seus sentidos, mantendo a sofistica��o e medidas compactas...');
INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (2, 'A smart TV da Samsung possui tela de 40" e oferece resolu��o Full HD, imagens duas vezes melhores que TVs HDs padr�o...');
INSERT INTO tb_descricoes_tecnicas(id_produto, descricao_tecnica) VALUES (3, 'Saia da mesmice. O smartphone LG est� mais divertido, r�pido, f�cil, cheio de selfies e com tela HD de incr�veis 5,3"...');






