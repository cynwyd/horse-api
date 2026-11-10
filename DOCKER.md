# Docker Build & Run Instructions — horse-api-pefv2

## Overview

| Property | Value |
|---|---|
| **Service Name** | horse-api-pefv2 |
| **Language** | Python 3 |
| **Framework** | FastAPI + Uvicorn |
| **Port** | 8000 (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

---

## Build

Build the image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-pefv2 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-pefv2
```

The API will be available at: http://localhost:8000

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status": "healthy", "message": "Hello from inside the container!"}
```

---

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-pefv2 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
