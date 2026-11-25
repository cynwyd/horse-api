# Docker Instructions — horse-api-4tx88

## Overview

This is a FastAPI application served by Uvicorn on port `8000`.

- **Service name:** `horse-api-4tx88`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-4tx88 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-4tx88
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

No environment variables are required to run this application.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Secret Handling

For production deployments, use:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
