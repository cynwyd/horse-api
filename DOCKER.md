# Docker Instructions — horse-api-3sj91

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn, served on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3sj91 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-3sj91
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

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file containing the build timestamp is included at `/app/VERSION`.
- Uvicorn logs are written to stdout, making them compatible with ECS/CloudWatch Logs.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager/KMS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
