# Docker Instructions — horse-api-jf2yt

## Overview

A FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-jf2yt

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jf2yt .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jf2yt
```

The application will be available at: http://localhost:8000

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

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the Dockerfile.

---

## Secrets Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Timestamp of when the image was containerized |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
