# Docker Instructions — horse-api-y1553

## Overview

This is a FastAPI HTTP API service running on Python 3 with uvicorn as the ASGI server.
The service name is `horse-api-y1553`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-y1553 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-y1553
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

## VERSION File

A `VERSION` file is generated at build time containing the UTC build timestamp (ISO 8601 format).
It is located at `/app/VERSION` inside the container.

To inspect it:
```bash
docker run --rm horse-api-y1553 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments, manage any future secrets using:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
