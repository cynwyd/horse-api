# horse-api-67ylm — Docker Build & Run Guide

## Overview

A FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

| Property | Value |
|---|---|
| **Service Name** | `horse-api-67ylm` |
| **Language** | Python 3 |
| **Framework** | FastAPI + Uvicorn |
| **Exposed Port** | `8000` (HTTP) |
| **Health Endpoint** | `GET /` → HTTP 200 |
| **Base Image** | `public.ecr.aws/amazonlinux/amazonlinux:2023` |
| **Run User** | `appuser` (non-root) |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-67ylm .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-67ylm
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-67ylm cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
