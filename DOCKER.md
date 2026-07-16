# Docker Instructions — horse-api-9mjib

## Overview

A Python FastAPI application served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-9mjib .
```

To embed a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  -t horse-api-9mjib .
```

## Run

```bash
docker run -p 8000:8000 horse-api-9mjib
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via Uvicorn    |

## Environment Variables

No environment variables are required for this application to start.

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format).
To inspect it:

```bash
docker run --rm horse-api-9mjib cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production secret management, use:
  - **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
