# Docker Build & Run Instructions — horse-api-3ar1d

## Overview

| Property | Value |
|---|---|
| **Service Name** | horse-api-3ar1d |
| **Language** | Python 3 |
| **Framework** | FastAPI 0.111.0 |
| **ASGI Server** | Uvicorn 0.30.1 |
| **Exposed Port** | 8000 (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

---

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-3ar1d \
  .
```

---

## Run

```bash
docker run -d \
  --name horse-api-3ar1d \
  -p 8000:8000 \
  horse-api-3ar1d
```

Verify the service is healthy:

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application. All configuration is self-contained.

---

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp passed via the `BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-3ar1d cat /app/VERSION
```

---

## Secret Handling

This application has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
