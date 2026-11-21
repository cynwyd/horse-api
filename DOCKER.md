# Docker Instructions — horse-api-7488n

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → returns `200 OK`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7488n .
```

## Run

```bash
docker run -p 8000:8000 horse-api-7488n
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

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of the image build.

```bash
docker run --rm horse-api-7488n cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the Dockerfile.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
