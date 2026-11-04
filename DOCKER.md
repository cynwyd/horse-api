# Docker Instructions — horse-api-k4qsd

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Health check:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` (UTC timestamp written at image build time)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k4qsd .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-k4qsd
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

## Security Notes

- The container runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secrets as environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
