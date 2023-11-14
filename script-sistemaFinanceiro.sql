-- Matheus Martins Viana
CREATE DATABASE IF NOT EXISTS sistemaFinanceiro;
USE sistemaFinanceiro;

-- tabela cliente
CREATE TABLE cliente (
    id_cliente INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(80) NOT NULL,
    telefone VARCHAR(15) NOT NULL, 
    cpf VARCHAR(11), 
    email VARCHAR(80) NULL,
    nascimento DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- tabela banco
CREATE TABLE banco (
    id_banco INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);

-- tabela conta
CREATE TABLE conta (
    id_conta INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_id_banco INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_id_banco) REFERENCES banco (id_banco),
    tipo VARCHAR(12) NOT NULL
);

-- tabela conta_cliente
CREATE TABLE conta_cliente (
	id_id_conta INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_id_conta) REFERENCES conta (id_conta),
    id_id_id_cliente INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_id_id_cliente) REFERENCES cliente (id_cliente),
    saldo FLOAT NOT NULL
);

-- Adicionando valores em Cliente 
INSERT INTO sistemaFinanceiro.cliente (nome_cliente, telefone, cpf, email, nascimento) VALUES
('Denise York', '44731329480', '2684832650', 'denisehwashington@superrito.com', '1996-10-01'),
('Lea Castro', '92703867890', '19370101551', 'thaisgoncalvescastro@einrot.com', '1979-01-02'), 
('Allan Lia', '89899033456', '43578309823', NULL, '1990-05-05');

-- Adicionando valores em banco
INSERT INTO sistemaFinanceiro.banco (nome) VALUES
('LEDBank'),
('BRBanco'),
('DesPag');

-- Adicionando valores em conta
INSERT INTO sistemaFinanceiro.conta (tipo, id_id_banco) VALUES
('Salário', 3),
('Poupança', 3),
('Corrente', 2),
('Corrente', 1),
('Salário', 1);

-- Adicionando valores em conta_cliente
INSERT INTO sistemaFinanceiro.conta_cliente (id_id_conta, id_id_id_cliente, saldo) VALUES
(1, 1, 1258.00),
(3, 2, 1010.55),
(2, 3, 3489.00),
(1, 1, 1169.80),
(2, 3, 1234.00);
