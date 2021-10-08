SET SEARCH_PATH TO TRABALHO_G1;

CREATE OR REPLACE FUNCTION incre_ingresso () 
RETURNS trigger AS $$
	BEGIN
		update sessao set ingressos_disponiveis = ingressos_disponiveis + 1;
		RETURN OLD;
	END;
	
$$ LANGUAGE plpgsql;

CREATE TRIGGER incre_ingre_disponivel AFTER DELETE ON reserva
	FOR EACH ROW
		EXECUTE FUNCTION incre_ingresso();		
