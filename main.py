import os
from mcp.server.asgi import ASGIApp
from scopus_mcp.server import server

# Use the stable, core ASGI server adapter that has no extra dependencies
app = ASGIApp(server)

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)
