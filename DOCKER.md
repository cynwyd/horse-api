# Docker Instructions — horse-api-0x9hl

## Overview

This is a FastAPI-based HTTP API service containerized on Amazon Linux 2023.

- **Service Name:** `horse-api-0x9hl`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** `8000` (HTTP)
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

The build context must be the root of the extracted source directory (where `main.py` and `requirements.txt` reside).

```bash
# From the root of the extracted source archive:
docker build -t horse-api-0x9hl .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-0x9hl
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

A `VERSION` file is generated at build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-0x9hl cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` to accept connections from outside the container.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
