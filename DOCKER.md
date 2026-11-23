# Docker Build & Run Instructions — horse-api-98x7x

## Overview

| Property | Value |
|---|---|
| **Service Name** | horse-api-98x7x |
| **Language** | Python 3 |
| **Framework** | FastAPI 0.111.0 |
| **ASGI Server** | Uvicorn 0.30.1 |
| **Exposed Port** | 8000 (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

---

## Build

The Docker build context must be the root of the extracted source directory.

```bash
# From the root of the extracted source archive:
docker build -t horse-api-98x7x .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-98x7x
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to run this application.

---

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-98x7x cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
