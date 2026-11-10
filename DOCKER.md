# Docker Instructions — horse-api-myd26

## Overview

A lightweight FastAPI REST API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-myd26`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-myd26 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-myd26
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

No environment variables are required to run this application.

For secret management in production deployments:
- **ECS:** Use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject secrets via the ECS task definition.
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) to manage secrets securely.

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
