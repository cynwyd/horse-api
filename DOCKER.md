# Docker Instructions — horse-api-qhv9c

## Overview

A FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC ISO-8601).

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-qhv9c .
```

## Run

```bash
docker run -p 8000:8000 horse-api-qhv9c
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
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Environment Variables

No environment variables are required to start the application.

## VERSION File

The image contains a `/app/VERSION` file with the UTC build timestamp in ISO-8601 format (e.g., `2024-01-15T10:30:00Z`).

To inspect it:
```bash
docker run --rm horse-api-qhv9c cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
