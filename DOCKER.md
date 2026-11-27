# Docker Instructions — horse-api-uo6qz

## Overview

A FastAPI HTTP API service served by Uvicorn, running on port **8000**.

- **Service name:** `horse-api-uo6qz`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200

A `VERSION` file is embedded at `/app/VERSION` containing the build timestamp (UTC ISO 8601 format).

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-uo6qz .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-uo6qz
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

Check the embedded VERSION file:

```bash
docker run --rm horse-api-uo6qz cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application to start. Configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
