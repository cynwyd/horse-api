# Docker Build and Run Instructions

## Overview

This document describes how to build and run the `horse-api-6qjen` Docker image standalone, outside the automated pipeline.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** uvicorn
- **Port:** 8000

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-6qjen .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-6qjen
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

If secrets are introduced in future versions, use the following approaches:

- **Amazon ECS:** Inject secrets via [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) in the ECS task definition.
- **Amazon EKS:** Use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for Kubernetes secret management.

---

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build definition |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
