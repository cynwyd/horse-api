# Docker Instructions — horse-api-h31c4

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-h31c4 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-h31c4
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-h31c4 cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application. Configuration is managed via ECS task definitions or Kubernetes manifests.

## Secret Handling

For any future secrets (API keys, credentials), use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
