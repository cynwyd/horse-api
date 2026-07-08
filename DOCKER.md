# Docker Instructions — horse-api-xqtoe

## Overview

A FastAPI-based REST API served via uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-xqtoe .
```

## Run

```bash
docker run -p 8000:8000 horse-api-xqtoe
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

- The image includes a `/app/VERSION` file containing the build timestamp (UTC).
- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
