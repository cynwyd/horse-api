# Docker Instructions — horse-api-5kzou

## Overview

A FastAPI-based REST API service running on Python 3 with Uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000 (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-5kzou .
```

## Run

```bash
docker run -p 8000:8000 horse-api-5kzou
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

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-5kzou cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

## Secret Handling

For sensitive configuration values, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
