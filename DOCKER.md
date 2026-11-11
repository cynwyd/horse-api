# Docker Instructions — horse-api-10vm1

## Overview

A minimal FastAPI HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` health endpoint.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-10vm1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-10vm1
```

The API will be available at: `http://localhost:8000`

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected via ECS task definitions or Kubernetes pod specs.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-10vm1 cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
