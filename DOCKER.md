# Docker Instructions — horse-api-u72ia

## Overview

A FastAPI-based REST API served by Uvicorn, containerized on Amazon Linux 2023.

| Property        | Value                          |
|-----------------|-------------------------------|
| Service Name    | `horse-api-u72ia`             |
| Language        | Python 3.9                    |
| Framework       | FastAPI 0.111.0 + Uvicorn 0.30.1 |
| Exposed Port    | `8000` (HTTP)                 |
| Health Check    | `GET /` → `200 OK`            |
| Run As          | `appuser` (non-root)          |

---

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-u72ia .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-u72ia .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-u72ia
```

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No required environment variables. The application is stateless and requires no external services.

---

## VERSION File

A `VERSION` file is written to `/app/VERSION` at build time containing the UTC build timestamp (e.g. `2024-01-15T10:30:00Z`). Pass `--build-arg BUILD_TIMESTAMP=<value>` to override.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
