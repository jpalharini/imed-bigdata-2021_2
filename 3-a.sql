SET SEARCH_PATH TO TRABALHO_G1;

CREATE OR REPLACE PROCEDURE criar_sessao(cod_espetaculo IN INT, inicio IN TIMESTAMP WITHOUT TIME ZONE, cod_periodicidade IN INT, duracao IN INT, preco IN NUMERIC)
LANGUAGE SQL
AS $$
	INSERT INTO sessao (cod_espetaculo, data_hora_inicio, cod_periodicidade, duracao, preco, total_ingressos, ingressos_disponiveis)
		VALUES (cod_espetaculo, inicio, cod_periodicidade, duracao, preco, 0, 0);
$$;