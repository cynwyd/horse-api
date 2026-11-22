# Docker Instructions — horse-api-xel82

## Overview

This is a FastAPI-based HTTP API service served by Uvicorn. The service name is `horse-api-xel82`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-xel82 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-xel82
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-xel82 cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via Uvicorn    |

## Environment Variables

No environment variables are required to start the application. Configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
