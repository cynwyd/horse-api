# Docker Build and Run Instructions

## Overview

This is a Python FastAPI application (`horse-api-08iah`) served by uvicorn on port `8000`.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-08iah \
  .
```

## Run

```bash
docker run -p 8000:8000 horse-api-08iah
```

The application will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application. All runtime configuration should be injected via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp passed via the `BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-08iah cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- uvicorn binds to `0.0.0.0:8000` for container compatibility.
- Service name: `horse-api-08iah`
