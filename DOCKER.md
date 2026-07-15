# Docker Instructions — horse-api

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: http://localhost:8000

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Port `8000` is exposed by the container.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
