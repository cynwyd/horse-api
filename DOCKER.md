# Docker Instructions — horse-api-18usu

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service name:** `horse-api-18usu`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Health check endpoint:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-18usu .
```

## Run

```bash
docker run -p 8000:8000 horse-api-18usu
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-18usu cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments, manage any future secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
