# Docker Instructions — horse-api-lck7q

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lck7q .
```

## Run

```bash
docker run -p 8000:8000 horse-api-lck7q
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-lck7q cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
