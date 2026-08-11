# Docker Instructions — horse-api-326b0

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Exposed Port:** `8000`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-326b0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-326b0
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

No environment variables are required for the application to start. Any runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp (UTC ISO 8601 format).

```bash
docker run --rm horse-api-326b0 cat /app/VERSION
```
