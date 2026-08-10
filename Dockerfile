FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

RUN uv pip install --system . fastmcp

EXPOSE 8000
ENV PORT=8000

# Removed the broken --mode option; fastmcp handles SSE automatically on these flags
CMD ["fastmcp", "run", "scopus_mcp/server.py", "--host", "0.0.0.0", "--port", "8000"]
