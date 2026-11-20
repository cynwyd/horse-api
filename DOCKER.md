# Docker Instructions — horse-api-wb62g

## Overview

A minimal FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (bound to `0.0.0.0:8000`)
- **Service name:** `horse-api-wb62g`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-wb62g .
```

## Run

```bash
docker run -p 8000:8000 horse-api-wb62g
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI server) |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built. To inspect it:

```bash
docker run --rm horse-api-wb62g cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are hardcoded in the image.
- For production deployments, manage any sensitive configuration using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
