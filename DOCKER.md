# horse-api-ab4d0 — Docker Build & Run Guide

## Overview

A minimal FastAPI HTTP API served by uvicorn on port `8000`.

- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI + uvicorn
- **Service name:** `horse-api-ab4d0`

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (public ECR, no authentication required)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ab4d0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ab4d0
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

No environment variables are required for this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Secrets Handling

This application has no detected secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-ab4d0 cat /app/VERSION
```

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |
