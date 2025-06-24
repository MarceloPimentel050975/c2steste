from peewee import *

from .meta_model import BaseModel

class Marca(BaseModel):
    
    nome = CharField(null=False)
    
    def __init__(self, id: int = None, nome: str = None):
        # O 'id' é opcional pois será auto-incrementado pelo banco de dados
        self.id = id
        self.nome = nome

    def __repr__(self):
        return f"Marca(id={self.id}, nome='{self.nome}')"

    def to_dict(self):
        return {
            "id": self.id,
            "nome": self.nome
        }
    
    class Meta:
        database = db_postgresql