# Docker Instructions — horse-api-ddaim

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC).

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ddaim .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ddaim
```

The API will be available at: http://localhost:8000

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application. Additional configuration
can be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secrets Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## VERSION File

The image contains a build timestamp at `/app/VERSION`:

```bash
docker run --rm horse-api-ddaim cat /app/VERSION
```
