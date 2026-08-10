# Docker Instructions — horse-api-6tpru

## Overview

A FastAPI HTTP API service running on Python 3.9 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Build

Build the image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-6tpru \
  .
```

## Run

```bash
docker run -p 8000:8000 horse-api-6tpru
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp passed via the
`BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-6tpru cat /app/VERSION
```

## Secret Handling

For production deployments, manage any secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
