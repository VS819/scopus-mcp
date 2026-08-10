FROM python:3.11-slim

# Install uv package manager
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Copy the repository code
COPY . .

# Install dependencies 
RUN uv pip install --system . mcp[cli]

# Expose port for cloud hosting
EXPOSE 8000

# Run the Scopus MCP server wrapped in an SSE transport layer
CMD ["mcp", "run", "scopus-mcp", "--transport", "sse", "--port", "8000"]
