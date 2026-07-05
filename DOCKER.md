# horse-api-2atge — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-2atge`
- **Port:** `8000`
- **Health check:** `GET /` → `{"status": "healthy", ...}`

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2atge .
```

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-2atge
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start this service. All configuration is handled via ECS task definitions or Kubernetes manifests in the deployment pipeline.

---

## Security Notes

- The container runs as a non-root user (`appuser`).
- No secrets or credentials are baked into the image.
- For production deployments, manage any secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
