# Docker Instructions — horse-api-4iezm

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status response.

- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + uvicorn
- **Port:** `8000`
- **Run as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-4iezm .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-4iezm
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

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-4iezm cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
