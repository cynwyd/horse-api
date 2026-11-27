# Docker Build & Run Instructions — horse-api-ti23r

## Overview

| Property | Value |
|---|---|
| **Service Name** | horse-api-ti23r |
| **Language** | Python 3 |
| **Framework** | FastAPI 0.111.0 + Uvicorn 0.30.1 |
| **Exposed Port** | `8000` (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

---

## Build

The build context must be the root of the extracted source directory.

```bash
# From the root of the extracted source archive:
docker build -t horse-api-ti23r .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ti23r
```

The API will be available at: http://localhost:8000

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

Check the embedded VERSION file:

```bash
docker run --rm horse-api-ti23r cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application. All runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
