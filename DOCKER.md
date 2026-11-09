# Docker Instructions — horse-api-1nn8b

## Overview

A FastAPI-based HTTP API service served by Uvicorn, running on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1nn8b .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1nn8b
```

## Verify

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

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp.
- The service name is `horse-api-1nn8b`.
- For secret handling in production, use:
  - **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
