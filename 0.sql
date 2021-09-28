-- Criar novo esquema
CREATE SCHEMA trabalho_g1;

SET SEARCH_PATH to trabalho_g1;

CREATE TABLE cidade (
	cod_cidade INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	uf CHAR(2) NOT NULL	
);
ALTER TABLE cidade ADD PRIMARY KEY (cod_cidade);
ALTER TABLE cidade ADD UNIQUE (nome, uf);

CREATE TABLE cliente (
	cod_cliente INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	sobrenome VARCHAR(50) NOT NULL,
	cpf VARCHAR(20) NOT NULL,
	endereco_entrega VARCHAR (150) NOT NULL,
	cod_cidade INT NOT NULL,
	status CHAR(1) DEFAULT 'A'
);
ALTER TABLE cliente ADD PRIMARY KEY (cod_cliente);

ALTER TABLE cliente ADD CONSTRAINT cliente_cidade_fk
	FOREIGN KEY (cod_cidade) REFERENCES cidade (cod_cidade);
    
ALTER TABLE cliente ADD CONSTRAINT cliente_status_ck 
  CHECK (status IN ('A', 'I')); 


CREATE TABLE periodicidade (
	cod_periodicidade INT NOT NULL,
	descricao VARCHAR(50) NOT NULL
);
ALTER TABLE periodicidade ADD PRIMARY KEY (cod_periodicidade);


CREATE TABLE tipo_espetaculo (
	cod_tipo_espetaculo INT NOT NULL,
	descricao VARCHAR(50) NOT NULL
);
ALTER TABLE tipo_espetaculo ADD PRIMARY KEY (cod_tipo_espetaculo);


CREATE TABLE estabelecimento (
	cod_estabelecimento INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(50),
	tem_estacionamento BOOLEAN DEFAULT 'f',
	cod_tipo_espetaculo INT NOT NULL,
        cod_cidade INT NOT NULL
);
ALTER TABLE estabelecimento ADD PRIMARY KEY (cod_estabelecimento);

ALTER TABLE estabelecimento ADD CONSTRAINT estab_estac_ck CHECK (tem_estacionamento IN ('T', 'F'));

ALTER TABLE estabelecimento ADD CONSTRAINT estab_tipo_espetaculo_fk
	FOREIGN KEY (cod_tipo_espetaculo) REFERENCES tipo_espetaculo (cod_tipo_espetaculo);

ALTER TABLE cliente ADD CONSTRAINT estabelecimento_cidade_fk
	FOREIGN KEY (cod_cidade) REFERENCES cidade (cod_cidade);

	
CREATE TABLE espetaculo (
	cod_espetaculo INT NOT NULL,
	nome VARCHAR(50),
	descricao VARCHAR(100),
	cod_estabelecimento INT NOT NULL
);
ALTER TABLE espetaculo ADD PRIMARY KEY (cod_espetaculo);
ALTER TABLE espetaculo ADD CONSTRAINT espetaculo_estab_fk
	FOREIGN KEY (cod_estabelecimento) REFERENCES estabelecimento (cod_estabelecimento);


CREATE TABLE sessao (
	cod_sessao INT NOT NULL,
	cod_espetaculo INT NOT NULL,
	data_hora_inicio DATE,
	duracao INT NOT NULL,
	total_ingressos INT DEFAULT 0,
        ingressos_disponiveis INT DEFAULT 0,
	preco NUMERIC NOT NULL
);
ALTER TABLE sessao ADD PRIMARY KEY (cod_sessao);
ALTER TABLE sessao ADD CONSTRAINT sessao_espetaculo_fk
	FOREIGN KEY (cod_espetaculo) REFERENCES espetaculo (cod_espetaculo);
ALTER TABLE sessao ADD cod_periodicidade INT NOT NULL;
ALTER TABLE sessao ADD CONSTRAINT sessao_periodicidade_fk
	FOREIGN KEY (cod_periodicidade) REFERENCES periodicidade (cod_periodicidade);

    CREATE TABLE pedido (
	cod_pedido INT NOT NULL,
	cod_cliente INT NOT NULL,
	data_pedido DATE NOT NULL,
	data_cancelamento DATE,
	status CHAR(1) DEFAULT 'A' NOT NULL CHECK (status IN ('A','I'))
);
ALTER TABLE pedido ADD PRIMARY KEY (cod_pedido);
ALTER TABLE pedido ADD CONSTRAINT pedido_cliente_fk
	FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente);

	
CREATE TABLE reserva (
	cod_pedido INT NOT NULL,
	cod_espetaculo INT NOT NULL,
	cod_sessao INT NOT NULL,
	cod_reserva INT NOT NULL,
	cadeira VARCHAR(10) NOT NULL
);
ALTER TABLE reserva ADD PRIMARY KEY (cod_reserva);
ALTER TABLE reserva ADD CONSTRAINT reserva_unique UNIQUE (cod_espetaculo, cod_sessao, cadeira);
ALTER TABLE reserva ADD CONSTRAINT reserva_pedido_fk
	FOREIGN KEY (cod_pedido) REFERENCES pedido (cod_pedido);
    
ALTER TABLE reserva ADD CONSTRAINT reserva_espetaculo_fk
	FOREIGN KEY (cod_espetaculo) REFERENCES espetaculo (cod_espetaculo);
    
ALTER TABLE reserva ADD CONSTRAINT reserva_sessao_fk
	FOREIGN KEY (cod_sessao) REFERENCES sessao (cod_sessao);