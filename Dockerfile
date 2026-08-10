FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Install the repository dependencies, core mcp library, and uvicorn web server
RUN uv pip install --system . mcp uvicorn

EXPOSE 8000
ENV PORT=8000

CMD ["python", "main.py"]
