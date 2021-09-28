SET SEARCH_PATH to trabalho_g1;

INSERT INTO cidade VALUES (DEFAULT,
 						  'Passo Fundo',
 						  'RS');
						  
INSERT INTO cliente VALUES (DEFAULT,
						   'Joao',
						   'Palharini',
						   '123.456.789-00',
						   'Rua Tal, 123',
						   3,
						   'A');

INSERT INTO periodicidade VALUES (DEFAULT,
								  'APENAS UMA VEZ');
							
INSERT INTO tipo_espetaculo VALUES (DEFAULT,
									'Filme');
							
INSERT INTO estabelecimento VALUES (DEFAULT,
									'Cinema ABC',
									'Rua Fulano, 456',
								   	true,
								   	2,
								   	3);

INSERT INTO espetaculo VALUES (DEFAULT,
							   'Velozes e Furiosos',
							   'Filme de corrida famoso',
							   3);
							   
SELECT * FROM periodicidade;

INSERT INTO sessao VALUES (DEFAULT,
						   4,
						   '2021-09-23 21:00:00',
						   120,
						   40,
						   40,
						   10.00,
						   2);
							
INSERT INTO pedido VALUES (DEFAULT,
						   2,
						   '2021-09-23 18:00:00',
						   NULL,
						   'A');


INSERT INTO reserva VALUES (4,
							4,
							4,
							DEFAULT,
							'10A');