# Docker Instructions — horse-api-bosvb

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-bosvb`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bosvb .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bosvb
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

No environment variables are required for this application.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager / KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file included in the image contains the build timestamp:

```bash
docker run --rm horse-api-bosvb cat /app/VERSION
```
