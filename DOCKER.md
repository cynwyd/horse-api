# Docker Instructions — horse-api-dyq6x

## Overview

A Python FastAPI REST API service running on uvicorn, bound to `0.0.0.0:8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-dyq6x .
```

## Run

```bash
docker run -p 8000:8000 horse-api-dyq6x
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601):

```bash
docker run --rm horse-api-dyq6x cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Health Check

| Property | Value |
|----------|-------|
| Path     | `/`   |
| Method   | GET   |
| Expected | 200   |

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
