# Docker Instructions — horse-api-y1ip2

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-y1ip2`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-y1ip2 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-y1ip2
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

No environment variables are required to start this application.

---

## Secrets Handling

For production deployments, use AWS Secrets Manager to inject any sensitive configuration:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager / KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `DOCKER.md` | This file |
