# horse-api-7uwf6 — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Framework:** FastAPI
- **Server:** uvicorn
- **Port:** 8000
- **Health endpoint:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7uwf6 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-7uwf6
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-7uwf6 cat /app/VERSION
```

---

## Environment Variables

No required environment variables. The application runs with defaults out of the box.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are baked into the image.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
