# Docker Instructions — horse-api-1mgz1

## Overview

A FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-1mgz1 \
  .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1mgz1
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

## Environment Variables

No environment variables are required to start the application. All runtime configuration should be provided via ECS task definitions or Kubernetes manifests.

## Secrets Handling

For sensitive environment variables, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp passed via the `BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-1mgz1 cat /app/VERSION
```
