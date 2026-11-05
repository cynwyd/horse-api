# Docker Instructions — horse-api-3kz6g

## Overview

A FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-3kz6g`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3kz6g .
```

## Run

```bash
docker run -p 8000:8000 horse-api-3kz6g
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-3kz6g cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- No `index.js` file exists in this repository — the hostname update instruction was not applicable.
