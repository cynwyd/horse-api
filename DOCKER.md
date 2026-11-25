# Docker Instructions — horse-api-4i7f4

## Overview

A FastAPI HTTP API service served by Uvicorn, running on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI `0.111.0`
- **ASGI Server:** Uvicorn `0.30.1`
- **Service Name:** `horse-api-4i7f4`

---

## Build

Build the Docker image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-4i7f4 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-4i7f4
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

No environment variables are required by this application.

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI/Uvicorn HTTP API |

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` with the build timestamp.
- For secret handling in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
