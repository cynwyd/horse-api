# Docker Instructions — horse-api-f5vrm

## Overview

A FastAPI HTTP API service served by Uvicorn, running on Python 3 (Amazon Linux 2023).

- **Service name:** `horse-api-f5vrm`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-f5vrm .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-f5vrm
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

## Notes

- The container runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp in ISO 8601 UTC format.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
