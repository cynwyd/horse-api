# Docker Instructions — horse-api-bu383

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Health Check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bu383 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-bu383
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format), generated at image build time:

```bash
docker run --rm horse-api-bu383 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is handled via ECS task definitions or Kubernetes manifests in production.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
