# Docker Instructions — horse-api-v6v8x

## Overview

This is a FastAPI-based REST API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-v6v8x`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Runs as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-v6v8x .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-v6v8x
```

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

No environment variables are required to start the application. The following can be optionally configured at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none currently)* | — | — |

---

## Notes

- The `VERSION` file at `/app/VERSION` contains the build timestamp.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
