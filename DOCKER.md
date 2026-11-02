# horse-api-ff0e4 — Docker Build & Run Guide

## Overview

A FastAPI HTTP API service served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-ff0e4`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` (contains the UTC timestamp from image build time)

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
# From the root of the extracted source archive:
docker build -t horse-api-ff0e4 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ff0e4
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

Check the VERSION file inside the container:

```bash
docker run --rm horse-api-ff0e4 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this service. The application is fully self-contained.

---

## Secret Handling (Production)

If secrets are added in the future, use the following AWS-native approaches:

- **ECS:** Inject secrets via [AWS Secrets Manager integration in ECS task definitions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [Secrets Manager or KMS encryption for Kubernetes secrets](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- No external dependencies (database, cache, messaging) are required.
