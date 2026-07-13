# Docker Instructions — horse-api-6i7tj

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service Name:** `horse-api-6i7tj`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** `8000`
- **Health Check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-6i7tj .
```

## Run

```bash
docker run -p 8000:8000 horse-api-6i7tj
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

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-6i7tj cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any sensitive environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
