# Docker Instructions — horse-api-2ovuw

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service name:** `horse-api-2ovuw`
- **Port:** `8000`
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-2ovuw \
  .
```

> The `BUILD_TIMESTAMP` build argument is written to `/app/VERSION` inside the image.
> If omitted, the `VERSION` file will be empty.

---

## Run

```bash
docker run -p 8000:8000 horse-api-2ovuw
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application. All runtime configuration
should be injected via ECS task definitions or Kubernetes manifests.

---

## Secrets Management

This application currently has no secrets. If secrets are added in future:

- **ECS:** Use [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Image Details

| Property       | Value                                      |
|----------------|--------------------------------------------|
| Base image     | `public.ecr.aws/amazonlinux/amazonlinux:2023` |
| Language       | Python 3.9                                 |
| Framework      | FastAPI 0.111.0                            |
| ASGI server    | Uvicorn 0.30.1                             |
| Run user       | `appuser` (non-root)                       |
| Exposed port   | `8000`                                     |
| Service label  | `service-name=horse-api-2ovuw`             |
| VERSION file   | `/app/VERSION` (build timestamp)           |
