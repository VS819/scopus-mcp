import os
from mcp.server.fastapi import FastMcpServer
from scopus_mcp import server as scopus_server

# Wrap the Scopus MCP server implementation inside an SSE-capable FastAPI handler
app = FastMcpServer(scopus_server)

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)
