# Docker Instructions — horse-api-3qdaw

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status JSON response.

- **Service name:** `horse-api-3qdaw`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200

---

## Build

Run the following from the root of the extracted source directory:

```bash
docker build -t horse-api-3qdaw .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-3qdaw
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

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
