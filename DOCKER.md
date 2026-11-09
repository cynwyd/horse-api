# Docker Instructions — horse-api-fymno

## Overview

A lightweight FastAPI HTTP API service. The application exposes a single `GET /` endpoint returning a health status response.

- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-fymno

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-fymno .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-fymno
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

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret handling in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
