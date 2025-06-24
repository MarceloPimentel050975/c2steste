import sqlite3
import sys  
from mcp.server.fastmcp import FastMCP

mcp = FastMCP(
    "Servidor de Veiculos SQLite e MCP",
    port=8000,
    host="0.0.0.0"
)


@mcp.resource("schema://main")
def get_schema() -> str:
    """Provide the database schema as a resource"""
    conn = sqlite3.connect("c2s.db")
    schema = conn.execute("SELECT sql FROM sqlite_master WHERE type='table'").fetchall()
    return "\n".join(sql[0] for sql in schema if sql[0])


@mcp.tool()
def query_data(sql: str) -> str:
    """Execute SQL queries safely"""
    conn = sqlite3.connect("c2s.db")
    try:
        result = conn.execute(sql).fetchall()
        return "\n".join(str(row) for row in result)
    except Exception as e:
        return f"Error: {str(e)}"

# Função para conectar ao banco
def conectar_bd():
    import os
    script_dir = os.path.dirname(os.path.abspath(__file__))
    print(script_dir)
    db_path = os.path.join(script_dir, 'c2s.db')
    return sqlite3.connect(db_path)

# Ferramenta 1: Contar clientes
@mcp.tool()
def contar_clientes(bairro: str = None) -> dict:
    """
    Conta o número total de clientes, opcionalmente filtrado por bairro.
    
    Args:
        bairro: Opcional - Nome do bairro para filtrar a contagem
        
    Returns:
        Um dicionário com o total de clientes e o filtro usado
    """
    conn = conectar_bd()
    cursor = conn.cursor()
    
    if bairro:
        cursor.execute("SELECT COUNT(*) FROM clientes WHERE bairro = ?", (bairro,))
    else:
        cursor.execute("SELECT COUNT(*) FROM clientes")
    
    total = cursor.fetchone()[0]
    conn.close()
    
    return {
        "total_clientes": total,
        "filtro_bairro": bairro
    }

# Ferramenta 2: Buscar cliente por nome
@mcp.tool()
def buscar_cliente_por_nome(nome: str) -> dict:
    """
    Busca clientes pelo nome (busca parcial).
    
    Args:
        nome: Nome ou parte do nome do cliente para buscar
        
    Returns:
        Um dicionário com os resultados da busca
    """
    if not nome:
        return {"erro": "Nome não fornecido", "clientes": []}
    
    conn = conectar_bd()
    cursor = conn.cursor()
    
    cursor.execute("SELECT id, nome, email, telefone, bairro, endereco FROM clientes WHERE nome LIKE ?", (f'%{nome}%',))
    resultados = cursor.fetchall()
    
    clientes = []
    for cliente in resultados:
        clientes.append({
            "id": cliente[0],
            "nome": cliente[1],
            "email": cliente[2],
            "telefone": cliente[3],
            "bairro": cliente[4],
            "endereco": cliente[5]
        })
    
    conn.close()
    
    return {
        "termo_busca": nome,
        "resultados_encontrados": len(clientes),
        "clientes": clientes
    }

# Ferramenta 3: Buscar cliente por bairro
@mcp.tool()
def buscar_cliente_por_bairro(bairro: str) -> dict:
    """
    Busca clientes pelo bairro.
    
    Args:
        bairro: Nome do bairro para buscar clientes
        
    Returns:
        Um dicionário com os resultados da busca
    """
    if not bairro:
        return {"erro": "Bairro não fornecido", "clientes": []}
    
    conn = conectar_bd()
    cursor = conn.cursor()
    
    cursor.execute("SELECT id, nome, email, telefone, bairro, endereco FROM clientes WHERE bairro LIKE ?", (f'%{bairro}%',))
    resultados = cursor.fetchall()
    
    clientes = []
    for cliente in resultados:
        clientes.append({
            "id": cliente[0],
            "nome": cliente[1],
            "email": cliente[2],
            "telefone": cliente[3],
            "bairro": cliente[4],
            "endereco": cliente[5]
        })
    
    conn.close()
    
    return {
        "termo_busca": bairro,
        "resultados_encontrados": len(clientes),
        "clientes": clientes
    }

@mcp.resource("clientes://estatisticas")
def get_estatisticas_clientes() -> str:
    conn = conectar_bd()
    cursor = conn.cursor()
    
    cursor.execute("SELECT COUNT(*) FROM clientes")
    total = cursor.fetchone()[0]
    
    cursor.execute("SELECT bairro, COUNT(*) as total FROM clientes GROUP BY bairro ORDER BY total DESC")
    bairros = cursor.fetchall()
    
    conn.close()
    
    resultado = f"Total de clientes: {total}\n\n"
    resultado += "Clientes por bairro:\n"
    for bairro in bairros:
        resultado += f"- {bairro[0]}: {bairro[1]} clientes\n"
    
    return resultado

try:
    import os
    cwd = os.getcwd()
    print(f"Diretório de trabalho atual: {cwd}", file=sys.stderr)
    
    if os.path.exists('c2s.db'):
        print("O arquivo clientes.db existe no caminho esperado", file=sys.stderr)
    else:
        print("O arquivo clientes.db NÃO existe no caminho esperado", file=sys.stderr)
    
    conn = conectar_bd()
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM clientes")
    total = cursor.fetchone()[0]
    conn.close()
    
    print(f"Banco de dados conectado com sucesso. Total de clientes: {total}", file=sys.stderr)
except Exception as e:
    print(f"ERRO: Não foi possível conectar ao banco de dados: {e}", file=sys.stderr)
    print("Certifique-se de que o arquivo 'c2s.db' existe e foi populado corretamente.", file=sys.stderr)
    import os
    script_dir = os.path.dirname(os.path.abspath(__file__))
    print(f"Diretório do script: {script_dir}", file=sys.stderr)
    exit(1)

if __name__ == "__main__":
    print("Iniciando servidor MCP com transporte SSE na porta 8000...", file=sys.stderr)
    mcp.run(transport="sse")  