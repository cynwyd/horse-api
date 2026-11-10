# Docker Instructions — horse-api-ez0qq

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → returns `{"status": "healthy", "message": "Hello from inside the container!"}`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ez0qq .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ez0qq
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

Check the VERSION file inside the container:
```bash
docker run --rm horse-api-ez0qq cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application.

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Logs are written to stdout/stderr and are compatible with ECS/CloudWatch logging.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
