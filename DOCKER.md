# horse-api-aiswg — Docker Build & Run Guide

## Overview

A lightweight FastAPI REST API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-aiswg`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200

---

## Prerequisites

- Docker installed and running
- Source code extracted/cloned locally

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-aiswg .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-aiswg
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

No environment variables are required for this application. All configuration is handled via the uvicorn startup command.

For production deployments on ECS or EKS, environment variables can be injected via:
- **ECS:** Task definition environment / [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
