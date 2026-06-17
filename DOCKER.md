# Docker Instructions — horse-api-1p4mb

## Overview

A Python FastAPI application served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1p4mb .
```

To include a `VERSION` file with a build timestamp, pass the `BUILD_TIMESTAMP` build argument:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-1p4mb .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1p4mb
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- The `VERSION` file at `/app/VERSION` contains the build timestamp passed via `BUILD_TIMESTAMP` build argument.
- For secret management in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
