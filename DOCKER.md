# Docker Instructions — horse-api-mxa69

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-mxa69`
- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → returns `{"status": "healthy", "message": "Hello from inside the container!"}`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mxa69 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-mxa69
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests.

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
