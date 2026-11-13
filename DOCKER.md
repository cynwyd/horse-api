# Docker Build & Run Instructions — horse-api-7dzpf

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

- **Service name:** `horse-api-7dzpf`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7dzpf .
```

To embed a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ) \
  -t horse-api-7dzpf .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-7dzpf
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

No environment variables are required to start the application. All runtime configuration can be injected via ECS task definitions or Kubernetes pod specs.

---

## Security Notes

- The container runs as a non-root user (`appuser`) for security.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp. To inspect it:

```bash
docker run --rm horse-api-7dzpf cat /app/VERSION
```
