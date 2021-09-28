SET SEARCH_PATH to trabalho_g1;

INSERT INTO cidade (nome,uf) 
	VALUES ('Porto Alegre','RS');
						  
INSERT INTO cliente (nome,sobrenome,cpf,endereco_entrega,cod_cidade,status)
	VALUES ('Joao','Palharini','123.456.789-00','Rua Tal, 123',3,'A');

INSERT INTO periodicidade (descricao)
	VALUES ('APENAS UMA VEZ');
							
INSERT INTO tipo_espetaculo (descricao)
	VALUES ('Filme');
							
INSERT INTO estabelecimento (nome, endereco, tem_estacionamento, cod_tipo_espetaculo, cod_cidade)
	VALUES ('Cinema ABC','Rua Fulano, 456',true,2,3);

INSERT INTO espetaculo (nome,descricao,cod_estabelecimento)
	VALUES ('Velozes e Furiosos','Filme de corrida famoso',3);

INSERT INTO sessao (cod_espetaculo,data_hora_inicio,duracao,total_ingressos,ingressos_disponiveis,preco,cod_periodicidade)
	VALUES (DEFAULT,4,'2021-09-23 21:00:00',120,40,40,10.00,2);
							
INSERT INTO pedido (cod_cliente,data_pedido,data_cancelamento)
	VALUES (DEFAULT,2,'2021-09-23 18:00:00',NULL,'A');

INSERT INTO reserva (cod_pedido,cod_espetaculo,cod_sessao,cadeira)
	VALUES (4,4,4,DEFAULT,'10A');