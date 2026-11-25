# Docker Instructions — horse-api-j58v4

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-j58v4`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-j58v4 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-j58v4
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

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-j58v4 cat /app/VERSION
```

---

## Notes

- No external dependencies (database, cache, message broker) are required.
- Uvicorn logs are written to stdout, compatible with ECS/CloudWatch log collection.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
