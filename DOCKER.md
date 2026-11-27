# horse-api-k06y3 — Docker Instructions

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port **8000**.

- **Service name:** `horse-api-k06y3`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k06y3 .
```

To embed a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-k06y3 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-k06y3
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application. All runtime configuration is provided via ECS task definitions or Kubernetes manifests.

---

## Secrets Handling

This application has no secrets. If secrets are added in future:
- **ECS:** Use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601). To inspect it:

```bash
docker run --rm horse-api-k06y3 cat /app/VERSION
```
