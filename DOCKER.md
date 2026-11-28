# Docker Instructions — horse-api-hrzcg

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with uvicorn.
The service exposes a single `GET /` health endpoint.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-hrzcg .
```

## Run

```bash
docker run -p 8000:8000 horse-api-hrzcg
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
Environment variables can be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-hrzcg cat /app/VERSION
```
