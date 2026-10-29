# Docker Instructions — horse-api-b22j5

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-b22j5 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-b22j5
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-b22j5 cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP Status:** `200`

## Environment Variables

No environment variables are required to run this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
