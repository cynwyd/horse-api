# Docker Build & Run Instructions — horse-api-lnmjm

## Overview

| Property | Value |
|---|---|
| **Service name** | `horse-api-lnmjm` |
| **Language** | Python 3 |
| **Framework** | FastAPI + uvicorn |
| **Exposed port** | `8000` |
| **Health check** | `GET /` → HTTP 200 |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lnmjm .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ) \
  -t horse-api-lnmjm .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-lnmjm
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start this application.

---

## VERSION File

The container includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-lnmjm cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
