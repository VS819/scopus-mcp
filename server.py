import os
from fastmcp import FastMCP
from scopus_mcp import server as scopus_server

# Initialize FastMCP which natively supports SSE routing and FastAPI out of the box
mcp = FastMCP("Scopus Server")

# Bind your imported scopus logic tool definitions to the fastmcp instance
mcp.tools = scopus_server.tools

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8000))
    # Direct execution string using built-in transport definitions
    mcp.run(transport="http", host="0.0.0.0", port=port)
