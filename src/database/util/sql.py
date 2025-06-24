import sqlite3
import random
from faker import Faker

fake = Faker('pt_BR')

bairros = ['Centro', 'Jardim América', 'Vila Nova', 'Bela Vista']

def create_database():
    conn = sqlite3.connect('clientes.db')
    cursor = conn.cursor()

    cursor.execute('''
    CREATE TABLE IF NOT EXISTS clientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        email TEXT,
        telefone TEXT,
        bairro TEXT NOT NULL,
        endereco TEXT
    )
    ''')

    for _ in range(50):
        nome = fake.name()
        email = fake.email()
        telefone = fake.phone_number()
        bairro = random.choice(bairros)
        endereco = fake.street_address()

        cursor.execute('''
        INSERT INTO clientes (nome, email, telefone, bairro, endereco)
        VALUES (?, ?, ?, ?, ?)
        ''', (nome, email, telefone, bairro, endereco))

    conn.commit()
    conn.close()

if __name__ == '__main__':
    create_database()
    print("Database created and populated with 50 sample records!")