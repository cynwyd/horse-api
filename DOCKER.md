# horse-api-1s140 — Docker Instructions

## Overview

A FastAPI REST API service running on Python 3 with uvicorn, served on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1s140 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1s140
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

## Environment Variables

No environment variables are required for this application. All configuration is handled via the uvicorn startup command.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file is included in the image at `/app/VERSION`.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
