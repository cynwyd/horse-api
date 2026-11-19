# Docker Instructions — horse-api-sfs7o

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service Name:** `horse-api-sfs7o`
- **Language:** Python 3
- **Framework:** FastAPI
- **Runtime Server:** Uvicorn
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-sfs7o .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-sfs7o
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

---

## VERSION File

A `VERSION` file is created at `/app/VERSION` during the Docker build, containing the UTC build timestamp in ISO 8601 format (e.g., `2024-01-15T10:30:00Z`).

To inspect it:
```bash
docker run --rm horse-api-sfs7o cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application. If needed in the future, pass them at runtime:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api-sfs7o
```

For production deployments on ECS or EKS, manage secrets using:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- Logs are written to stdout — fully compatible with ECS/CloudWatch and Kubernetes log collectors.
