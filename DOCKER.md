# Docker Instructions — horse-api-efstl

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3.9
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Port:** 8000 (HTTP)
- **Health Check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-efstl .
```

## Run

```bash
docker run -p 8000:8000 horse-api-efstl
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-efstl cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application. Environment variables can be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
