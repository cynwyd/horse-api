# Docker Instructions — horse-api-ocinw

## Overview

A FastAPI application served by Uvicorn on port **8000**.

- **Service name:** `horse-api-ocinw`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Runtime:** Python 3 / Uvicorn (ASGI)
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-ocinw .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ocinw
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-ocinw cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
