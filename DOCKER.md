# Docker Instructions — horse-api-epho1

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The service binds to `0.0.0.0:8000` and is suitable for containerized deployments.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-epho1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-epho1
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

## VERSION File

A `VERSION` file is created at build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-epho1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. The following can be
optionally overridden at runtime via ECS task definitions or Kubernetes manifests:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Port

| Port | Protocol | Description |
|---|---|---|
| `8000` | HTTP | FastAPI application served by Uvicorn |
