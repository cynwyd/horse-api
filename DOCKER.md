# Docker Instructions — horse-api-onzb3

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status JSON response.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-onzb3 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-onzb3
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

## Environment Variables

No environment variables are required for this application.

## Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
