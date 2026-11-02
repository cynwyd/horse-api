# Docker Instructions — horse-api-mohto

## Overview

A Python FastAPI service exposing a health/status endpoint, served via uvicorn on port 8000.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-mohto .
```

## Run

```bash
docker run -p 8000:8000 horse-api-mohto
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                     |
|------|----------|---------------------------------|
| 8000 | HTTP     | FastAPI HTTP server via uvicorn |

## Environment Variables

No environment variables are required for this application.

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the build (e.g. `2024-01-15T10:30:00Z`). It is located at `/app/VERSION` inside the container.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
