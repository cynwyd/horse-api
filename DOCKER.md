# Docker Build and Run Instructions — horse-api-1iyz5

## Overview

- **Language:** Python 3
- **Framework:** FastAPI (ASGI via Uvicorn)
- **Port:** 8000 (HTTP)
- **Service Name:** horse-api-1iyz5

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws/amazonlinux/amazonlinux:2023` (public ECR, no authentication required)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1iyz5 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1iyz5
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

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-1iyz5 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

For secret handling in production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn listens on `0.0.0.0:8000` to accept connections from all interfaces.
