from datetime import datetime
from peewee import *

import entity

# define a conexão com o banco de dados
db = PostgresqlDatabase('c2s_teste', user='c2s', password='c2s',
                           host='localhost', port=5432)


if __name__ == "__main__":
    try:
        # Conectar ao banco de dados
        db.connect()
        # Criar as tabelas (se não existirem)
        # A ordem é importante devido às chaves estrangeiras:
        # Marca -> Modelo -> Veiculo
        db.create_tables([entity.Marca, entity.Modelo, entity.Veiculo])
        print("Tabelas criadas com sucesso ou já existentes.")

    except OperationalError as e:
        print(f"Erro ao conectar ou criar tabelas: {e}")
    finally:
        # Sempre feche a conexão com o banco de dados
        if not db.is_closed():
            db.close()