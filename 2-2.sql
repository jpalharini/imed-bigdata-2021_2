SET SEARCH_PATH TO trabalho_g1;

-- Verificar assento reservado e data da reserva por determinado cliente
CREATE OR REPLACE FUNCTION verificar_assento_reservado(v_cod_cliente INT) RETURNS RECORD AS $$
	DECLARE resultado RECORD;
	BEGIN
		SELECT  c.nome, r.cadeira, p.data_pedido INTO resultado
			FROM reserva AS r
			JOIN pedido AS p ON (r.cod_pedido = p.cod_pedido)
			JOIN cliente AS c ON (p.cod_cliente = c.cod_cliente)
		WHERE c.cod_cliente = v_cod_cliente;
	
	IF resultado IS null THEN
		RAISE EXCEPTION 'Cliente não possui nenhuma reserva'
			USING HINT = 'Verifique o cliente informado';
	ELSE
		RETURN resultado;
	END IF;
END;
$$ LANGUAGE PLPGSQL