# Docker Instructions — horse-api-mqanz

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-mqanz`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mqanz .
```

## Run

```bash
docker run -p 8000:8000 horse-api-mqanz
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start this application.

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
