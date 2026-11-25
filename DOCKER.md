# horse-api-tzfmt — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Uvicorn. The service exposes a single `GET /` endpoint returning a health/status JSON response.

- **Service name:** `horse-api-tzfmt`
- **Language:** Python 3.9
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-tzfmt .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-tzfmt
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

No environment variables are required for this application. Configuration is managed via ECS task definitions or Kubernetes manifests in the deployment pipeline.

---

## Secrets Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the Docker build context |
| `VERSION` | Build timestamp included in the image |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
