# Docker Instructions — horse-api-rlf55

## Overview

A FastAPI-based HTTP API service running on Python 3.9 with uvicorn as the ASGI server.
The service name includes the suffix `-rlf55` as requested.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-rlf55 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-rlf55
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

## Environment Variables

No environment variables are required for this application. Configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

## Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Security Notes

- The container runs as a non-root user (`appuser`) for security.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
