# horse-api-3oysz — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-3oysz`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3oysz .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-3oysz
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

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

---

## Secret Handling

This application has no secrets. For future secret management in production:

- **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject secrets as environment variables in the task definition.
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) via the Secrets Store CSI driver.
