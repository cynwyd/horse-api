# horse-api-wpj28 — Docker Build & Run Guide

## Overview

| Item | Details |
|---|---|
| **Service Name** | horse-api-wpj28 |
| **Language** | Python 3 |
| **Framework** | FastAPI 0.111.0 (uvicorn 0.30.1) |
| **Port** | 8000 (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

---

## Build

The Docker build context is the root of the extracted source directory.

```bash
# From the root of the extracted source archive:
docker build -t horse-api-wpj28 .
```

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-wpj28
```

The API will be available at: http://localhost:8000

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required at runtime.
- For production deployments on ECS or EKS, use AWS Secrets Manager to inject any future secrets:
  - **ECS:** [Using Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Security on EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
