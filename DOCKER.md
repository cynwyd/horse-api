# Docker Instructions — horse-api-elbzl

## Overview

A minimal FastAPI HTTP API served by uvicorn. The service exposes a single `GET /` health endpoint.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-elbzl .
```

## Run

```bash
docker run -p 8000:8000 horse-api-elbzl
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the image build.

To inspect it:
```bash
docker run --rm horse-api-elbzl cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn)      |

## Environment Variables

No environment variables are required for basic operation.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments, manage any secrets via:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
