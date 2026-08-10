FROM python:3.11-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Install the package plus uvicorn to host the web app
RUN uv pip install --system . uvicorn

EXPOSE 8000
ENV PORT=8000

CMD ["python", "main.py"]
