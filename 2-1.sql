SET SEARCH_PATH TO TRABALHO_G1;

DROP FUNCTION verificar_ingressos_disponiveis;

CREATE OR REPLACE FUNCTION verificar_ingressos_disponiveis (sessao INT) RETURNS INT AS $$
		DECLARE ingressos INT;
		BEGIN
			SELECT
				ingressos_disponiveis INTO ingressos
			FROM
				sessao s
			WHERE
				cod_sessao = sessao;

			IF ingressos is null THEN
				RAISE EXCEPTION 'Código de sessão % não existe', sessao
					USING HINT = 'Favor verificar o código da sessão informado';
			ELSE
				RETURN ingressos;
			END IF;
		END;
$$ LANGUAGE PLPGSQL