# Docker Instructions — horse-api-4yrq5

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-4yrq5 \
  .
```

## Run

```bash
docker run -p 8000:8000 horse-api-4yrq5
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

No environment variables are required to start the application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp passed via the `BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-4yrq5 cat /app/VERSION
```

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |
