# Docker Instructions — horse-api-1t5fa

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service Name:** horse-api-1t5fa
- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** 8000

---

## Build

The build context must be the root of the extracted source directory (where `main.py` and `requirements.txt` reside).

```bash
# From the root of the extracted source archive:
docker build -t horse-api-1t5fa .
```

To include a build timestamp in the VERSION file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-1t5fa .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-1t5fa
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

No environment variables are required for this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests.

---

## Security Notes

- The container runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
