# Docker Instructions — horse-api-ppygm

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-ppygm`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ppygm .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ppygm
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application.

## Notes

- The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.
- The application runs as a non-root user (`appuser`) for security.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
