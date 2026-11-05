# horse-api-240hz — Docker Build & Run Guide

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-240hz .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  -t horse-api-240hz .
```

## Run

```bash
docker run -p 8000:8000 horse-api-240hz
```

## Verify

Once running, verify the application is healthy:

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
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Environment Variables

No environment variables are required to start this application.

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC ISO 8601 format). It is generated at image build time via the `BUILD_TIMESTAMP` build argument. If not provided, the current build time is used automatically.

```bash
docker run --rm horse-api-240hz cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS or EKS, manage any secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
