# Docker Instructions — horse-api-uadt8

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-uadt8`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200

## Build

Run from the root of the extracted source directory:

```bash
docker build -t horse-api-uadt8 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-uadt8
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp in ISO 8601 UTC format (e.g., `2024-01-15T10:30:00Z`).

```bash
docker run --rm horse-api-uadt8 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

For secret management in production deployments:
- **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
