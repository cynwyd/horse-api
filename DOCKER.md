# Docker Instructions — horse-api-j4696

## Overview

A FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-j4696`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-j4696 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-j4696
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Verify

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to run this application.

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
