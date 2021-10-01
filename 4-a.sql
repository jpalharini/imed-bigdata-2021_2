SET SEARCH_PATH TO TRABALHO_G1;

CREATE OR REPLACE FUNCTION tem_ingressos_disponiveis () 
RETURNS trigger AS $$
	DECLARE disponivel BOOLEAN;
	BEGIN
		SELECT
			(ingressos_disponiveis > 0) INTO disponivel
		FROM
			sessao
		WHERE
			cod_sessao = new.cod_sessao;
		IF disponivel THEN
			RETURN NEW;
		ELSE
			RAISE EXCEPTION 'Não há ingressos disponíveis para a sessão %', new.cod_sessao
					USING HINT = 'Favor selecionar outra sessão';
		END IF;
	END;
$$ LANGUAGE plpgsql

CREATE TRIGGER reserva_com_ingresso_disponivel BEFORE INSERT ON reserva
	FOR EACH ROW
		EXECUTE FUNCTION tem_ingressos_disponiveis();
		