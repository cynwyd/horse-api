# Docker Instructions — horse-api-0no4d

## Overview

A minimal FastAPI HTTP API served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0no4d .
```

## Run

```bash
docker run -p 8000:8000 horse-api-0no4d
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

No environment variables are required to run this application.

## Notes

- The `VERSION` file at `/app/VERSION` contains the build timestamp (UTC ISO 8601 format).
- The application runs as a non-root `appuser` for security.
- For secret management in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
