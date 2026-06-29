# horse-api-v14on — Docker Build & Run Guide

## Overview

A FastAPI HTTP API service served by uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** uvicorn 0.30.1
- **Exposed Port:** `8000`
- **Health Check:** `GET /` → HTTP 200

---

## Build

The build context must be the root of the extracted source directory.

```bash
# From the root of the extracted source archive:
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-v14on \
  .
```

---

## Run

```bash
docker run -d \
  --name horse-api-v14on \
  -p 8000:8000 \
  horse-api-v14on
```

### Verify the container is healthy

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

### Check the VERSION file

```bash
docker exec horse-api-v14on cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any sensitive configuration.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.

---

## Stopping the Container

```bash
docker stop horse-api-v14on
docker rm horse-api-v14on
```
