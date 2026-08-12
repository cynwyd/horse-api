# Docker Instructions — horse-api-netji

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a health endpoint at `GET /` and binds to `0.0.0.0:8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-netji .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-netji
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Verify VERSION File

```bash
docker run --rm horse-api-netji cat /app/VERSION
# Example output: 2026-08-12T17:39:45Z
```

---

## Environment Variables

No environment variables are required to run this application.

For secret handling in production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |
