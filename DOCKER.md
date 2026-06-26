# Docker Instructions — horse-api-epppy

## Overview

A FastAPI REST API service served by Uvicorn, running on port `8000`.

- **Service name:** `horse-api-epppy`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-epppy .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-epppy
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-epppy cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. All runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
