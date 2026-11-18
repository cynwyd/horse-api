# Docker Build and Run Instructions

## Overview

This is a FastAPI application served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** horse-api-ccbcd
- **Port:** 8000 (HTTP)
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ccbcd .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ccbcd
```

The API will be available at: http://localhost:8000

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

No environment variables are required to run this application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
