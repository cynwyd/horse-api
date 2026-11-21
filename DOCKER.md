# Docker Instructions — horse-api-byz09

## Overview

A FastAPI-based REST API service running on Python 3 with Uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000 (HTTP)
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-byz09 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-byz09
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (e.g., `2024-01-15T10:30:00Z`). To inspect it:

```bash
docker run --rm horse-api-byz09 cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application to start. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments, manage any secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
