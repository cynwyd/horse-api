# Docker Instructions — horse-api-xigth

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` health endpoint and is bound to `0.0.0.0:8000` inside the container.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` in the image.

---

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-xigth .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-xigth
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Verify VERSION File

```bash
docker run --rm horse-api-xigth cat /app/VERSION
# Example output: 2026-06-26T23:11:45Z
```

---

## Environment Variables

No environment variables are required to run this application. The following may be provided at runtime via ECS task definitions or Kubernetes manifests:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

---

## Exposed Ports

| Port | Protocol | Description |
|---|---|---|
| `8000` | HTTP | FastAPI application served by uvicorn |

---

## Secret Handling

For production deployments, manage any future secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
