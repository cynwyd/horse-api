# horse-api-edda7 — Docker Instructions

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** 8000

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-edda7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-edda7
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

No environment variables are required to start this application.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS:** [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Timestamp of the containerization build |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
