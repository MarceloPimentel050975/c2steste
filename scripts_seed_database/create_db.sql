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



