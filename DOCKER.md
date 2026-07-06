# Docker Instructions — horse-api-c1s28

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-c1s28`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-c1s28 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-c1s28
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-c1s28 cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
