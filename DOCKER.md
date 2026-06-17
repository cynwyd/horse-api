# Docker Instructions — horse-api-ojdkf

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-ojdkf`
- **Language:** Python 3.9
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** `8000`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ojdkf .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ojdkf
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

No environment variables are required for this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Timestamp of the containerization build |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
