SET SEARCH_PATH TO TRABALHO_G1;

CREATE TABLE notificacao
	(id INT NOT NULL,
	 data_pedido TIMESTAMP WITHOUT TIME ZONE,
	 cod_pedido INT NOT NULL,
	 mensagem VARCHAR(255));
	 
ALTER TABLE notificacao 
	ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

CREATE OR REPLACE PROCEDURE declarar_valores(cliente IN INTEGER)
LANGUAGE plpgsql
AS $$
	DECLARE
		pc RECORD;
	BEGIN
		FOR pc IN 
				SELECT * FROM pedido WHERE cod_cliente = cliente AND data_pedido > CURRENT_DATE - INTERVAL '30' DAY
			LOOP
				INSERT INTO notificacao (data_pedido, cod_pedido, mensagem)
					VALUES (pc.data_pedido, 
							pc.cod_pedido,
					    	(SELECT SUM(s.preco) FROM sessao s INNER JOIN reserva r ON pc.cod_pedido = r.cod_pedido));
			END LOOP;
	END;
$$;