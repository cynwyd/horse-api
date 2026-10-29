# Docker Instructions — horse-api-rqvlb

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn as the ASGI server.
The image is built on Amazon Linux 2023 and runs as a non-root `appuser`.

A `VERSION` file is generated at build time containing the UTC timestamp of the build.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-rqvlb .
```

## Run

```bash
docker run -p 8000:8000 horse-api-rqvlb
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## Environment Variables

No environment variables are required to start this application.

## Secret Handling

For production deployments, manage any secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as non-root user `appuser` for security.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp.
