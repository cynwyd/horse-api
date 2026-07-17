# Docker Instructions — horse-api-mbth8

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the UTC timestamp of the build.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mbth8 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-mbth8
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

## Verify VERSION File

```bash
docker run --rm horse-api-mbth8 cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via Uvicorn    |

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root `appuser` for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp (ISO 8601 format).
