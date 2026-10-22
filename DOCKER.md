# Docker Instructions — horse-api-3lxyc

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Health check:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3lxyc .
```

## Run

```bash
docker run -p 8000:8000 horse-api-3lxyc
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

A `VERSION` file is generated at build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-3lxyc cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. The following can be optionally configured at runtime via ECS task definitions or Kubernetes manifests:

| Variable | Description | Default |
|----------|-------------|---------|
| _(none currently required)_ | | |

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
