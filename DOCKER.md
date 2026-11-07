# Docker Instructions — horse-api-j4fst

## Overview

A FastAPI HTTP API service served by Uvicorn on port 8000.

- **Service name:** `horse-api-j4fst`
- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Exposed port:** 8000

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-j4fst .
```

## Run

```bash
docker run -p 8000:8000 horse-api-j4fst
```

## Health Check

The application exposes a health endpoint at the root path:

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application. All runtime configuration is provided via ECS task definitions or Kubernetes manifests.

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
