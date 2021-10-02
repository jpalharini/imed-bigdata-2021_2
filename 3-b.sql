SET SEARCH_PATH TO trabalho_g1;

CREATE OR REPLACE PROCEDURE define_total_ingressos(v_cod_sessao IN INT, v_total_ingressos IN INT)
LANGUAGE SQL
AS $$
	UPDATE sessao
	SET total_ingressos = v_total_ingressos
	WHERE cod_sessao = v_cod_sessao;
$$;
