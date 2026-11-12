# Docker Instructions — horse-api-agif7

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` health endpoint.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-agif7 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-agif7
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-agif7 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS or EKS, manage any secrets via:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
