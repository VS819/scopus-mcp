import os
import mcp.server.fastapi
from scopus_mcp.server import server

# This relies on the core mcp library to serve the scopus server over an SSE web port
app = mcp.server.fastapi.FastMcpServer(server)

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)
