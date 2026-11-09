# Docker Instructions — horse-api-2d8m5

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2d8m5 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-2d8m5
```

## Verify

Once running, the application is accessible at:

```
http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp.
- For secret management in ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For secret management in EKS, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
