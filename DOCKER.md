# Docker Instructions — horse-api-2te7g

## Overview

A minimal FastAPI HTTP API service running on Python 3 with Uvicorn.

- **Service Name:** `horse-api-2te7g`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2te7g .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-2te7g
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application.

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

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` inside the container.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
