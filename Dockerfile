FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Install the scopus package plus fastapi and uvicorn for the SSE web server layer
RUN uv pip install --system . fastapi uvicorn mcp[cli]

EXPOSE 8000
ENV PORT=8000

# Execute your server script directly
CMD ["python", "server.py"]
