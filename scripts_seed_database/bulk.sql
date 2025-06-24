CREATE TABLE Marca (
  idMarca SERIAL  NOT NULL ,
  nome VARCHAR(20)      ,
PRIMARY KEY(idMarca));




CREATE TABLE Modelo (
  idModelo SERIAL  NOT NULL ,
  Marca_idMarca INTEGER   NOT NULL ,
  nome VARCHAR(255)      ,
PRIMARY KEY(idModelo)  ,
  FOREIGN KEY(Marca_idMarca)
    REFERENCES Marca(idMarca));


CREATE INDEX Modelo_FKIndex1 ON Modelo (Marca_idMarca);


CREATE INDEX IFK_Rel_02 ON Modelo (Marca_idMarca);


CREATE TABLE Veiculo (
  idVeiculo SERIAL  NOT NULL ,
  Modelo_idModelo INTEGER   NOT NULL ,
  numero_chassi VARCHAR(255)    ,
  cor VARCHAR(255)    ,
  ano_fabricacao INTEGER      ,
PRIMARY KEY(idVeiculo)  ,
  FOREIGN KEY(Modelo_idModelo)
    REFERENCES Modelo(idModelo));


CREATE INDEX Veiculo_FKIndex1 ON Veiculo (Modelo_idModelo);


CREATE INDEX IFK_Rel_01 ON Veiculo (Modelo_idModelo);





INSERT INTO Marca (nome) VALUES ('Toyota');
INSERT INTO Marca (nome) VALUES ('Honda');
INSERT INTO Marca (nome) VALUES ('Ford');
INSERT INTO Marca (nome) VALUES ('Chevrolet');
INSERT INTO Marca (nome) VALUES ('Volkswagen');
INSERT INTO Marca (nome) VALUES ('BMW');
INSERT INTO Marca (nome) VALUES ('Mercedes-Benz');
INSERT INTO Marca (nome) VALUES ('Hyundai');
INSERT INTO Marca (nome) VALUES ('Nissan');
INSERT INTO Marca (nome) VALUES ('Fiat');

-- Modelos para Toyota (Marca_idMarca: 1)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Corolla', 1);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Camry', 1);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('RAV4', 1);

-- Modelos para Honda (Marca_idMarca: 2)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Civic', 2);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('HR-V', 2);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('CR-V', 2);

-- Modelos para Ford (Marca_idMarca: 3)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Focus', 3);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Fusion', 3);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Ranger', 3);

-- Modelos para Chevrolet (Marca_idMarca: 4)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Onix', 4);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('S10', 4);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Tracker', 4);

-- Modelos para Volkswagen (Marca_idMarca: 5)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Gol', 5);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('T-Cross', 5);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Virtus', 5);

-- Modelos para BMW (Marca_idMarca: 6)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Série 3', 6);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('X1', 6);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('X5', 6);

-- Modelos para Mercedes-Benz (Marca_idMarca: 7)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Classe C', 7);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('GLA', 7);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('C 200', 7);

-- Modelos para Hyundai (Marca_idMarca: 8)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('HB20', 8);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Creta', 8);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Tucson', 8);

-- Modelos para Nissan (Marca_idMarca: 9)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Kicks', 9);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Frontier', 9);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Sentra', 9);

-- Modelos para Fiat (Marca_idMarca: 10)
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Cronos', 10);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Strada', 10);
INSERT INTO Modelo (nome, Marca_idMarca) VALUES ('Pulse', 10);

-- Veículos para Corolla (Modelo_idModelo: 1)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000001, 3, 2022, 1);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000002, 1, 2023, 1);

-- Veículos para Camry (Modelo_idModelo: 2)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000003, 6, 2021, 2);

-- Veículos para RAV4 (Modelo_idModelo: 3)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000004, 2, 2023, 3);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000005, 5, 2024, 3);

-- Veículos para Civic (Modelo_idModelo: 4)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000006, 1, 2022, 4);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000007, 4, 2023, 4);

-- Veículos para HR-V (Modelo_idModelo: 5)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000008, 2, 2024, 5);

-- Veículos para CR-V (Modelo_idModelo: 6)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000009, 6, 2022, 6);

-- Veículos para Focus (Modelo_idModelo: 7)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000010, 3, 2019, 7);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000011, 1, 2020, 7);

-- Veículos para Fusion (Modelo_idModelo: 8)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000012, 6, 2018, 8);

-- Veículos para Ranger (Modelo_idModelo: 9)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000013, 2, 2023, 9);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000014, 5, 2024, 9);

-- Veículos para Onix (Modelo_idModelo: 10)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000015, 4, 2022, 10);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000016, 1, 2023, 10);

-- Veículos para S10 (Modelo_idModelo: 11)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000017, 3, 2021, 11);

-- Veículos para Tracker (Modelo_idModelo: 12)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000018, 2, 2023, 12);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000019, 5, 2024, 12);

-- Veículos para Gol (Modelo_idModelo: 13)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000020, 1, 2020, 13);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000021, 4, 2021, 13);

-- Veículos para T-Cross (Modelo_idModelo: 14)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000022, 2, 2022, 14);

-- Veículos para Virtus (Modelo_idModelo: 15)
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000023, 3, 2023, 15);
INSERT INTO veiculo (numero_chassi, cor, ano_fabricacao, Modelo_idModelo) VALUES (1000000000000024, 6, 2024, 15);
