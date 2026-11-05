# horse-api — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port 8000.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Exposed Port:** `8000`
- **Service Name:** `horse-api-8pyoy`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-8pyoy .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-8pyoy
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

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are hardcoded in the image.
- For production deployments, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
