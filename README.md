## Configuração e instalação do ambiente via docker compose☕️
 

# PostgreSQL:

Vai ser instalado um banco de dados e carregado todos script de criação de tabelas e geração de dados fake para as tabelas

docker compose up -d --build

# Server MCP

No terminal raiz do projeto no diretorio C2STESTE do projeto clonado do repositório do git


# Configurar o acesso do PostgreSQL no servidor MCP

export POSTGRES_CONNECTION_STRING="postgresql://c2s:c2s@localhost:5432/c2s_teste"

# Executar o servidor MCP

mcp dev src/main_server_mcp.py