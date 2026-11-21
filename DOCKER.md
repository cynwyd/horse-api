# Docker Instructions — horse-api-33hvu

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-33hvu`
- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Port:** 8000

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-33hvu .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-33hvu
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

---

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (via Secrets Manager or KMS encryption)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Timestamp of containerization |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
