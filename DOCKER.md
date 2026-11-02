# Docker Instructions — horse-api-s6l4i

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-s6l4i .
```

## Run

```bash
docker run -p 8000:8000 horse-api-s6l4i
```

## Verify

Once running, the API is accessible at:

```
http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
