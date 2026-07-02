# horse-api-a6k88 — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service exposing a health/status endpoint.

- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** 8000
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-a6k88 \
  .
```

> The `BUILD_TIMESTAMP` build argument is written to `/app/VERSION` inside the image.

---

## Run

```bash
docker run -p 8000:8000 horse-api-a6k88
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

The Docker image includes a `/app/VERSION` file containing the build timestamp passed via `BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-a6k88 cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
