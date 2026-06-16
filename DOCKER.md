# Docker Instructions — horse-api-3sbxe

## Overview

This is a Python FastAPI application served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-3sbxe`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3sbxe .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-3sbxe
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required for this application.

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

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` with the build timestamp.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
