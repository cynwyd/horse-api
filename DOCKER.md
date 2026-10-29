# Docker Instructions — horse-api-jps9x

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION` inside the image.

---

## Build

The build context must be the root of the extracted source directory (where `Dockerfile` and `main.py` reside).

```bash
# From the root of the extracted source archive:
docker build -t horse-api-jps9x .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jps9x
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

## Inspect VERSION file

```bash
docker run --rm horse-api-jps9x cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application. Any future configuration should be injected via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the image.

---

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
