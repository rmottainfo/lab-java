CREATE DATABASE IF NOT EXISTS pantrydb;

USE pantrydb;

-- Cria tabela Produto
CREATE TABLE IF NOT EXISTS Produto (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PLU INT NOT NULL,
    descricao VARCHAR(100),
    dimensao_medida VARCHAR(10),
    quantidade_embalagem INT NOT NULL,
    PRIMARY KEY (id)
);

-- Cria tabela Categoria
CREATE TABLE IF NOT EXISTS Categoria (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- Cria tabela Supermercado
CREATE TABLE IF NOT EXISTS Supermercado (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    regiao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- Cria tabela Dispensa
CREATE TABLE IF NOT EXISTS Dispensa (
    id INT NOT NULL AUTO_INCREMENT,
    produto_id INT NOT NULL,
    categoria_id INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

-- Cria tabela Compra
CREATE TABLE IF NOT EXISTS Compra (
    id INT NOT NULL AUTO_INCREMENT,
    produto_id INT NOT NULL,
    categoria_id INT NOT NULL,
    preco_unitario FLOAT NOT NULL,
    quantidade INT NOT NULL,
    supermercado_id INT NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (supermercado_id) REFERENCES Supermercado(id)
);
