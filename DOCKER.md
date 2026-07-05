# horse-api-ymead — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single health endpoint at `GET /` and listens on port `8000`.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-ymead \
  .
```

> **Note:** The `BUILD_TIMESTAMP` build argument is used to write a `VERSION` file inside the image at `/app/VERSION`. If omitted, the file will be empty.

## Run

```bash
docker run -p 8000:8000 horse-api-ymead
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

No environment variables are required to start the application. All configuration is self-contained.

## Port Reference

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Security Notes

- The container runs as a non-root user (`appuser`) for security.
- No secrets or credentials are required at runtime.
- For production deployments on ECS or EKS, use AWS Secrets Manager to inject any future secrets:
  - [ECS Secrets via Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - [EKS Secrets via Secrets Manager or KMS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
