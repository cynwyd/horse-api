# horse-api-kz0p0 — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-kz0p0 \
  .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-kz0p0
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

No environment variables are required for this service. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Notes

- The `VERSION` file inside the container is populated at build time via the `BUILD_TIMESTAMP` build argument.
- The service binds to `0.0.0.0:8000` to accept connections from all interfaces inside the container.
- The application runs as a non-root `appuser` for security.
- For secret handling in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
