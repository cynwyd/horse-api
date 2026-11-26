# Docker Instructions — horse-api-ot4y2

## Overview

This is a FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Service name:** horse-api-ot4y2
- **Port:** 8000 (HTTP)
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ot4y2 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ot4y2
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For sensitive configuration values, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
