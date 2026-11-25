# Docker Instructions — horse-api-2kdk5

## Overview

A FastAPI REST API service running on Python 3 with uvicorn, served on port 8000.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-2kdk5 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-2kdk5
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

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## Health Check

- **Path:** `GET /`
- **Expected HTTP Status:** `200`

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file in the image contains the build timestamp.
- Service name includes the `-2kdk5` suffix as requested.
