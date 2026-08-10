FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

RUN uv pip install --system . fastmcp

EXPOSE 8000
ENV PORT=8000

# Use the -m flag to let fastmcp locate the installed module natively
CMD ["fastmcp", "run", "-m", "scopus_mcp", "--host", "0.0.0.0", "--port", "8000"]
