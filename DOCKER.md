# Docker Instructions — horse-api-s0c6w

## Overview

A FastAPI application served by Uvicorn on port `8000`.

- **Service name:** `horse-api-s0c6w`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** `8000`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-s0c6w .
```

## Run

```bash
docker run -p 8000:8000 horse-api-s0c6w
```

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application. Any runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-s0c6w cat /app/VERSION
```
