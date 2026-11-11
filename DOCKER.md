# Docker Instructions — horse-api-kwsti

## Overview

This is a Python FastAPI application served via Uvicorn on port `8000`.

A `VERSION` file is generated at build time containing the UTC timestamp of the build.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-kwsti .
```

## Run

```bash
docker run -p 8000:8000 horse-api-kwsti
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

No environment variables are required to start this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
