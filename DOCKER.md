# Docker Instructions — horse-api

## Overview

A Python FastAPI service that returns a health/status response, served by uvicorn on port 8000.

- **Service name:** `horse-api-zeqfu`
- **Language:** Python 3
- **Framework:** FastAPI + uvicorn
- **Port:** 8000 (HTTP)
- **Health check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-zeqfu .
```

## Run

```bash
docker run -p 8000:8000 horse-api-zeqfu
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` and contains the UTC timestamp of the build. To inspect it:

```bash
docker run --rm horse-api-zeqfu cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
