# Docker Instructions — horse-api-ujoy9

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ujoy9 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ujoy9
```

## Verify

Once running, the application is accessible at:

```
http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Health Check

| Property | Value |
|---|---|
| **Path** | `/` |
| **Method** | `GET` |
| **Expected HTTP Code** | `200` |

## Environment Variables

No environment variables are required to start this application.

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-ujoy9 cat /app/VERSION
```

## Secrets Management

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- Service name: `horse-api-ujoy9`
