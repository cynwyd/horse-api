# horse-api-dv95t — Docker Instructions

## Overview

A lightweight FastAPI REST API served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Service Name:** `horse-api-dv95t`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-dv95t .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-dv95t
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

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC):

```bash
docker run --rm horse-api-dv95t cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application to start. Configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Port

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
