# Docker Instructions — horse-api-tqpzx

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Port:** 8000 (HTTP)
- **Health check:** `GET /` → HTTP 200
- **User:** `appuser` (non-root)
- **VERSION file:** included at `/app/VERSION`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-tqpzx .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-tqpzx
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

No environment variables are required for this application. All configuration is self-contained.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
