# horse-api-kwq66 — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-kwq66`
- **Port:** `8000` (HTTP)
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-kwq66 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-kwq66
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

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Secret Handling

For production deployments, use:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
