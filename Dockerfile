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
ENV PORT=8000

# Execute the module directly using the python module flag or the exact script entrypoint
CMD ["mcp", "run", "-m", "scopus_mcp", "--transport", "sse"]
