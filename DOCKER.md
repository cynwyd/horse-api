# horse-api-pw2rp — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/greeting response.

## Build

Build the Docker image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-pw2rp .
```

## Run

```bash
docker run -p 8000:8000 horse-api-pw2rp
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

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-pw2rp cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required to start the application. Configuration can be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
