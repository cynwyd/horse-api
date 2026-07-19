# Docker Instructions — horse-api (service-name-zb4ls)

## Overview

A FastAPI-based HTTP API service served by Uvicorn, running on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t service-name-zb4ls .
```

## Run

```bash
docker run -p 8000:8000 service-name-zb4ls
```

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No required environment variables. The application has no external dependencies (database, messaging, etc.).

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm service-name-zb4ls cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For secret handling in production, use:
  - **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
