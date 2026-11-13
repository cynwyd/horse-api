# Docker Build and Run Instructions

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1rr35 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1rr35
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

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-1rr35 cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0` to accept connections from outside the container.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
