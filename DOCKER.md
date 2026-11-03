# Docker Instructions — horse-api-n87wt

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status response.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-n87wt .
```

## Run

```bash
docker run -p 8000:8000 horse-api-n87wt
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

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
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required for this application.

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required at runtime.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
