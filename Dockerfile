FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Include fastmcp, uvicorn, and fastapi packages cleanly 
RUN uv pip install --system . fastmcp fastapi uvicorn

EXPOSE 8000
ENV PORT=8000

CMD ["python", "server.py"]
