# Docker Instructions — horse-api-stbkv

## Overview

A minimal FastAPI HTTP API served by uvicorn. Exposes a single `GET /` health endpoint.

- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3.9
- **Framework:** FastAPI + uvicorn
- **Port:** `8000`
- **Run user:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-stbkv .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-stbkv
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

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (e.g., `2024-01-15T10:30:00Z`).

To inspect it:
```bash
docker run --rm horse-api-stbkv cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. The following can be used to override defaults at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

For secret management in production, use:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Stopping the Container

```bash
docker stop <container_id>
```
