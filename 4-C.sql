SET SEARCH_PATH TO TRABALHO_G1;

CREATE OR REPLACE FUNCTION decre_ingresso () 
RETURNS trigger AS $$
	BEGIN
		update sessao set ingressos_disponiveis = ingressos_disponiveis - 1;
	END;
	
$$ LANGUAGE plpgsql	

CREATE TRIGGER decre_ingre_disponivel AFTER INSERT ON reserva
	FOR EACH ROW
		EXECUTE FUNCTION decre_ingresso();	
