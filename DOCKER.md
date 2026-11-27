# Docker Instructions — horse-api-3x1h4

## Overview

This is a FastAPI-based HTTP API service containerized with Amazon Linux 2023.

- **Service name:** `horse-api-3x1h4`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed port:** `8000`
- **Health check endpoint:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3x1h4 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-3x1h4
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (e.g. `2026-11-27T10:44:50Z`). To inspect it:

```bash
docker run --rm horse-api-3x1h4 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application.

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
