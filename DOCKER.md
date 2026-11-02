# Docker Instructions — horse-api-x1zq5

## Overview

A FastAPI-based HTTP API service served by Uvicorn. The service exposes a single `GET /` endpoint and runs on port **8000**.

- **Service name:** `horse-api-x1zq5`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Runs as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-x1zq5 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-x1zq5
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-x1zq5 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
