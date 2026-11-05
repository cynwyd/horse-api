# Docker Instructions — horse-api-io0xs

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-io0xs`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp included in the image |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-io0xs .
```

## Run

```bash
docker run -p 8000:8000 horse-api-io0xs
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Environment Variables

No environment variables are required for the base application. If needed in future, pass them via `-e` flags or an env file:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api-io0xs
```

## Secrets Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Health Check

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```
