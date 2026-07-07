# horse-api-w5mme — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Health endpoint:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

---

## Build

The build context must be the root of the extracted source directory (where `main.py` and `requirements.txt` reside).

```bash
# From the root of the extracted source archive:
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-w5mme \
  .
```

> **Note:** The `BUILD_TIMESTAMP` build argument is used to write a `VERSION` file into the image at `/app/VERSION`. Pass any timestamp string you prefer.

---

## Run

```bash
docker run -d \
  --name horse-api-w5mme \
  -p 8000:8000 \
  horse-api-w5mme
```

### Verify the container is healthy

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

### Check the VERSION file

```bash
docker exec horse-api-w5mme cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application. All configuration is handled at the ECS task definition level.

---

## Secrets Handling

This application has no secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Stop & Remove

```bash
docker stop horse-api-w5mme && docker rm horse-api-w5mme
```
