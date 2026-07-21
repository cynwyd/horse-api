# Docker Instructions — horse-api-jiwjq

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

- **Service name:** `horse-api-jiwjq`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jiwjq .
```

## Run

```bash
docker run -p 8000:8000 horse-api-jiwjq
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-jiwjq cat /app/VERSION
# Expected: UTC timestamp, e.g. 2024-07-21T00:17:55Z
```

## Environment Variables

No environment variables are required to start this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
