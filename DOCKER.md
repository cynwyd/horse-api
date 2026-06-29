# Docker Instructions — horse-api-dwo0v

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service listens on port `8000` and exposes a health check endpoint at `/`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-dwo0v .
```

## Run

```bash
docker run -p 8000:8000 horse-api-dwo0v
```

The API will be available at: `http://localhost:8000`

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp in ISO 8601 format (e.g., `2024-01-15T10:30:00Z`).

To inspect it:
```bash
docker run --rm horse-api-dwo0v cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |
