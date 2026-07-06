# Docker Build and Run Instructions — horse-api-vx5td

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed Port:** `8000`
- **Health Check Endpoint:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vx5td .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-vx5td
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-vx5td cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application.

For secret handling in production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` to accept connections from all interfaces.
