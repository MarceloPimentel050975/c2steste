from peewee import *

import entity
import db_postgresql

class Veiculo(Model):
   
    numero_chassi = IntegerField(null=False, unique=True)
    cor = IntegerField(null=False)
    ano_fabricacao = IntegerField(null=False)
    # Define a chave estrangeira para a tabela Modelo.
    id_modelo = ForeignKeyField(entity.Modelo, backref='veiculos', null=False)
    
    def __init__(self, id: int = None, numero_chassi: int = None, cor: int = None,
                 ano_fabricacao: int = None, id_modelo: int = None):
        self.id = id
        self.numero_chassi = numero_chassi
        self.cor = cor
        self.ano_fabricacao = ano_fabricacao
        self.id_modelo = id_modelo
     

    def __repr__(self):
        return (f"Veiculo(id={self.id}, chassi={self.numero_chassi}, cor={self.cor}, "
                f"ano={self.ano_fabricacao}, id_modelo={self.id_modelo})")

    def to_dict(self):
        return {
            "id": self.id,
            "numero_chassi": self.numero_chassi,
            "cor": self.cor,
            "ano_fabricacao": self.ano_fabricacao,
            "id_modelo": self.id_modelo
        }
    
    class Meta:
        database = db_postgresql