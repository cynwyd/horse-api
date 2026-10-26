# Docker Instructions — horse-api-o4yt1

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-o4yt1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-o4yt1
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

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-o4yt1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
