# Docker Instructions — horse-api-58rtb

## Overview

This is a FastAPI-based REST API service running on Python 3 with Uvicorn as the ASGI server.
The service name is `horse-api-58rtb`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-58rtb .
```

## Run

```bash
docker run -p 8000:8000 horse-api-58rtb
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

## Environment Variables

No environment variables are required to start the application.

## Exposed Ports

| Port | Protocol | Description         |
|------|----------|---------------------|
| 8000 | HTTP     | FastAPI application |

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-58rtb cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0` to accept connections from all interfaces.
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
