# Docker Instructions — horse-api-mq28r

## Overview

A FastAPI HTTP API service served by Uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Service Name:** horse-api-mq28r

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mq28r .
```

## Run

```bash
docker run -p 8000:8000 horse-api-mq28r
```

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-mq28r cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application. All configuration is provided at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
- No external dependencies (database, cache, messaging) are required.
