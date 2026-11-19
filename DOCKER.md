# Docker Build & Run Instructions — horse-api-o6e2q

## Overview

A FastAPI REST API service running on Python 3 with Uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Base Image:** public.ecr.aws/amazonlinux/amazonlinux:2023

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-o6e2q .
```

## Run

```bash
docker run -p 8000:8000 horse-api-o6e2q
```

## Verify

Once running, verify the service is healthy:

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-o6e2q cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. The service is fully self-contained.

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
