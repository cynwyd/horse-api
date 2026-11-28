# Docker Instructions — horse-api-5l56k

## Overview

A FastAPI-based HTTP API served via Uvicorn on port `8000`. The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC ISO 8601).

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-5l56k .
```

## Run

```bash
docker run -p 8000:8000 horse-api-5l56k
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

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

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-5l56k cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For secret management in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
