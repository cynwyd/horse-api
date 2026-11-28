# Docker Instructions — horse-api-vn484

## Overview

A minimal FastAPI REST API served by Uvicorn on port `8000`.

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-vn484 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-vn484
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

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-vn484 cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
