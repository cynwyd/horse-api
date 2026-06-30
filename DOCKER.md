# horse-api — Docker Instructions

## Overview

A FastAPI-based HTTP API served by Uvicorn. The image includes a `VERSION` file at `/app/VERSION` containing the UTC timestamp of when the image was built.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: http://localhost:8000

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The image contains a `/app/VERSION` file with the build timestamp in ISO 8601 UTC format:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-07-01T12:00:00Z
```

## Environment Variables

No required environment variables. The application runs with defaults out of the box.

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI / Uvicorn server |

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets are required for standalone operation.
- For production deployments on ECS or EKS, manage any secrets via:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
