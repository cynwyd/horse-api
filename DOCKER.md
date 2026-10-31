# Docker Instructions — horse-api-hfobm

## Overview

A FastAPI-based HTTP API service served via `uvicorn` on port `8000`.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-hfobm .
```

## Run

```bash
docker run -p 8000:8000 horse-api-hfobm
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

No environment variables are required to start this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp.
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
