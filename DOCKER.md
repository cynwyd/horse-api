# horse-api-vfmga — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn. Exposes a single `GET /` endpoint returning a health/status JSON response.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vfmga .
```

## Run

```bash
docker run -p 8000:8000 horse-api-vfmga
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

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-vfmga cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any runtime configuration should be injected via ECS task definitions or Kubernetes pod specs.

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
