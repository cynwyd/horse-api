# Docker Instructions — horse-api-xnkls

## Overview

A lightweight FastAPI HTTP API served by Uvicorn. The container listens on port `8000` and exposes a health/greeting endpoint at `GET /`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-xnkls .
```

## Run

```bash
docker run -p 8000:8000 horse-api-xnkls
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

No environment variables are required for this application. All configuration is handled via the `CMD` instruction in the Dockerfile.

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp at which the image was built:

```bash
docker run --rm horse-api-xnkls cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` to accept connections from all interfaces inside the container.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
