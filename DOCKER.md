# horse-api-vx83j — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vx83j .
```

## Run

```bash
docker run -p 8000:8000 horse-api-vx83j
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Environment Variables

No environment variables are required to start this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-vx83j cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments on ECS or EKS, manage any secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
