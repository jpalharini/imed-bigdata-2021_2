SET SEARCH_PATH TO trabalho_g1;

CREATE OR REPLACE FUNCTION excluir_reserva()
RETURNS trigger AS $$
BEGIN
	INSERT INTO historico_reserva
	SELECT cod_reserva, cod_pedido, cod_espetaculo, cod_sessao, cod_reserva, cadeira FROM reserva
	WHERE cod_reserva = OLD.cod_reserva;
	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER backup_reserva BEFORE DELETE ON reserva
	FOR EACH ROW
		EXECUTE FUNCTION excluir_reserva();