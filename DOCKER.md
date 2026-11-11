# horse-api-c4x4o — Docker Instructions

## Overview

A FastAPI-based HTTP API service served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-c4x4o`
- **Language:** Python 3
- **Framework:** FastAPI `0.111.0`
- **ASGI Server:** uvicorn `0.30.1`
- **Exposed port:** `8000`
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-c4x4o .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-c4x4o
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

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601):

```bash
docker run --rm horse-api-c4x4o cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for the application to start. The following can be overridden at runtime via ECS task definition or `docker run -e`:

| Variable | Default | Description |
|---|---|---|
| *(none required)* | — | All configuration is baked in via uvicorn CLI flags |

For production deployments on ECS or EKS, manage secrets using:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- Logs are written to stdout/stderr — compatible with ECS CloudWatch Logs and EKS log aggregation.
