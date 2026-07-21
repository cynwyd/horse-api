# Docker Instructions — horse-api-c653b

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Port:** `8000`
- **Health check endpoint:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-c653b .
```

## Run

```bash
docker run -p 8000:8000 horse-api-c653b
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Notes

- The `VERSION` file at `/app/VERSION` contains the build timestamp (UTC ISO 8601).
- The application runs as a non-root `appuser` for security.
- For secret handling in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
