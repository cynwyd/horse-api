# Docker Instructions — horse-api-64exj

## Overview

This is a Python FastAPI application containerized on Amazon Linux 2023. It runs with `uvicorn` and listens on port `8000`.

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `DOCKER.md` | This file |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-64exj .
```

## Run

```bash
docker run -p 8000:8000 horse-api-64exj
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

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

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments on ECS or EKS, manage any secrets using:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
