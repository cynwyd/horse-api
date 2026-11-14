# Docker Instructions — horse-api-x1pte

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-x1pte`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-x1pte .
```

## Run

```bash
docker run -p 8000:8000 horse-api-x1pte
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-x1pte cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
