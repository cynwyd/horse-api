# Docker Instructions — horse-api-l4yoi

## Overview

A FastAPI Python service exposing a health/status REST endpoint. The service runs on port **8000** using Uvicorn as the ASGI server.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-l4yoi .
```

## Run

```bash
docker run -p 8000:8000 horse-api-l4yoi
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-l4yoi cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

## Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application endpoint |

## Health Check

| Property            | Value |
|---------------------|-------|
| **Path**            | `/`   |
| **Expected Status** | `200` |

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
