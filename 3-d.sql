SET SEARCH_PATH TO trabalho_g1;

CREATE OR REPLACE PROCEDURE criar_reserva(cod_espetaculo IN INT, cod_sessao IN INT, 
cod_pedido IN INT, cadeira IN VARCHAR(10))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO reserva (cod_espetaculo, cod_sessao, cod_pedido, cadeira)
	VALUES (cod_espetaculo, cod_sessao, cod_pedido, cadeira);
	
	EXCEPTION
	WHEN sqlstate '23503' THEN
		RAISE EXCEPTION 'Sessão ou espetáculo não existem'
			USING HINT = 'Favor verificar o código da sessão ou espetáculo informado';
END; 
$$




