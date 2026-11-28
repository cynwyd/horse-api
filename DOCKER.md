# Docker Instructions — horse-api-296o4

## Overview

A FastAPI REST API service running on Python 3 with uvicorn as the ASGI server.

- **Service Name:** `horse-api-296o4`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

Run from the root of the extracted source directory:

```bash
docker build -t horse-api-296o4 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-296o4
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application. All runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

---

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the build:

```
/app/VERSION
```

Example content: `2024-01-15T10:30:00Z`

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

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- Logs are written to stdout/stderr — compatible with ECS CloudWatch Logs and Kubernetes log aggregation.
