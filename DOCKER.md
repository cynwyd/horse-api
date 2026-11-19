# Docker Instructions — horse-api-ea428

## Overview

A FastAPI HTTP API service served by Uvicorn, running on port `8000`.

- **Service name:** `horse-api-ea428`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3.9
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Exposed port:** `8000`
- **Health check endpoint:** `GET /` → HTTP 200

---

## Build

Run from the root of the extracted source directory:

```bash
docker build -t horse-api-ea428 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ea428
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

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-ea428 cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
