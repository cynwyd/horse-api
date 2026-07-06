# Docker Instructions — horse-api-oir7w

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp from image build time

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-oir7w .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-oir7w
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

No environment variables are required for this application.

For secret handling in production, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-oir7w cat /app/VERSION
```
