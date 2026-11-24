# Docker Instructions — horse-api-wy6ui

## Overview

A lightweight FastAPI HTTP API served by Uvicorn. The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC ISO-8601).

## Build

The build context must be the root of the extracted source directory.

```bash
# From the root of the extracted source directory:
docker build -t horse-api-wy6ui .
```

## Run

```bash
docker run -p 8000:8000 horse-api-wy6ui
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

## Verify VERSION file

```bash
docker run --rm horse-api-wy6ui cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

## Environment Variables

No environment variables are required to run this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS or EKS, use AWS Secrets Manager to inject any future secrets as environment variables:
  - [ECS Secrets via Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - [EKS Secrets via Secrets Manager or KMS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
