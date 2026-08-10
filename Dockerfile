FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Install the scopus package and the fastmcp CLI utility globally
RUN uv pip install --system . fastmcp

EXPOSE 8000
ENV PORT=8000

# Tell fastmcp to run the installed module package entry point directly over an HTTP/SSE web port
CMD ["fastmcp", "run", "scopus_mcp/server.py", "--mode", "sse", "--host", "0.0.0.0", "--port", "8000"]
