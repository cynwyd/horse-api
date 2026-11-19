# horse-api-jflzn — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

| Property        | Value                          |
|-----------------|-------------------------------|
| Service Name    | `horse-api-jflzn`             |
| Base Image      | Amazon Linux 2023              |
| Port            | `8000` (HTTP)                  |
| Health Check    | `GET /` → HTTP 200             |
| Run User        | `appuser` (non-root)           |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jflzn .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jflzn
```

The API will be available at: http://localhost:8000

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

No environment variables are required to start this application. All runtime configuration should be injected via ECS task definitions or Kubernetes pod specs.

---

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file in the image contains the build timestamp:

```bash
docker run --rm horse-api-jflzn cat /app/VERSION
```
