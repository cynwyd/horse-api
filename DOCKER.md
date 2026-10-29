# Docker Build and Run Instructions — horse-api-35gs8

## Overview

This is a Python FastAPI application served by uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws/amazonlinux/amazonlinux:2023` (public, no authentication required)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-35gs8 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-35gs8
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

No environment variables are required to start the application.

---

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
