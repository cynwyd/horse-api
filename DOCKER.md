# Docker Instructions — horse-api-jwo0v

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3.9
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jwo0v .
```

## Run

```bash
docker run -p 8000:8000 horse-api-jwo0v
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via environment variables rather than hardcoded in the image.

For secret management in AWS:
- **ECS:** Use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-jwo0v cat /app/VERSION
```
