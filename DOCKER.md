# Docker Instructions — horse-api-a8bwj

## Overview

This is a FastAPI HTTP API service running on Python 3 with uvicorn as the ASGI server.
The service exposes a health/status endpoint at `GET /`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-a8bwj .
```

## Run

```bash
docker run -p 8000:8000 horse-api-a8bwj
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-a8bwj cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments on ECS or EKS, manage any secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
