# Docker Instructions — horse-api-5c7e0

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-5c7e0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-5c7e0
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

- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
