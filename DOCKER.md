# Docker Instructions — horse-api-xzbj1

## Overview

A FastAPI HTTP API service served by uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI
- **Service name:** `horse-api-xzbj1`
- **Exposed port:** `8000`
- **Health check:** `GET /` → `200 OK`

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-xzbj1 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-xzbj1
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Secrets Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file in the image contains the build timestamp:

```bash
docker run --rm horse-api-xzbj1 cat /app/VERSION
```
