# Docker Instructions — horse-api-a2398

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-a2398 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-a2398
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the build. To inspect it:

```bash
docker run --rm horse-api-a2398 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
