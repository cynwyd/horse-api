# Docker Instructions — horse-api-dg3em

## Overview

This is a FastAPI-based REST API service containerized on Amazon Linux 2023 with Python 3.
The application is served by `uvicorn` on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-dg3em .
```

## Run

```bash
docker run -p 8000:8000 horse-api-dg3em
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

No environment variables are currently required to start the application.

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the build (e.g., `20260101T120000Z`). It is located at `/app/VERSION` inside the container.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn listens on `0.0.0.0:8000` to accept connections from outside the container.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
