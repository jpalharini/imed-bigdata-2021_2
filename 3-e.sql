SET SEARCH_PATH TO TRABALHO_G1;

CREATE TABLE notificacao
	(id INT NOT NULL,
	 data_pedido TIMESTAMP WITHOUT TIME ZONE,
	 cod_pedido INT NOT NULL,
	 mensagem VARCHAR(255));
	 
ALTER TABLE notificacao 
	ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

CREATE OR REPLACE PROCEDURE declarar_valores(cliente IN INT)
LANGUAGE SQL
AS $$
	INSERT INTO sessao (cod_espetaculo, data_hora_inicio, cod_periodicidade, duracao, preco, total_ingressos, ingressos_disponiveis)
		VALUES (cod_espetaculo, inicio, cod_periodicidade, duracao, preco, 0, 0);
$$;