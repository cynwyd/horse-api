# Docker Instructions — horse-api-dmo9h

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000 (HTTP)
- **Health Check:** `GET /` → `200 OK`

---

## Build

The Docker build context must be the root of the extracted source directory.

```bash
# From the root of the extracted source archive:
docker build -t horse-api-dmo9h .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-dmo9h
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

No environment variables are required for this application to start. All runtime configuration should be injected via ECS task definitions or Kubernetes pod specs.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Timestamp of the containerization build |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
