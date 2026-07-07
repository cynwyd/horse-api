# Docker Instructions — horse-api-9q47q

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port 8000.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Base Image:** Amazon Linux 2023

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-9q47q .
```

## Run

```bash
docker run -p 8000:8000 horse-api-9q47q
```

## Health Check

The application exposes a health endpoint at `/`:

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to run this application.

## Notes

- The application runs as a non-root `appuser` for security.
- Uvicorn binds to `0.0.0.0:8000` inside the container.
- For production deployments on ECS or EKS, secrets should be managed via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
