# Docker Instructions — horse-api-k72dv

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** 8000
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k72dv .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-k72dv
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

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-k72dv cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
