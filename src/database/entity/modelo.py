from peewee import *

import entity

class Modelo(Model):
    
    nome = CharField(null=False)
    # Define a chave estrangeira para a tabela Marca.
    # Peewee automaticamente cuidará do 'id_marca' por trás dos panos.
    id_marca = ForeignKeyField(entity.Marca, backref='modelos', null=False)
    
    def __init__(self, id: int = None, nome: str = None, id_marca: int = None):
        self.id = id
        self.nome = nome
        self.id_marca = id_marca
      
    def __repr__(self):
        return f"Modelo(id={self.id}, nome='{self.nome}', id_marca={self.id_marca})"

    def to_dict(self):
         return {
            "id": self.id,
            "nome": self.nome,
            "id_marca": self.id_marca
        }
    
    class Meta:
        database = db_postgresql