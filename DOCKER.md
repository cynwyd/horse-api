# Docker Instructions — horse-api-kx1qu

## Overview

This is a FastAPI application served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-kx1qu`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-kx1qu .
```

## Run

```bash
docker run -p 8000:8000 horse-api-kx1qu
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

A `VERSION` file is created at `/app/VERSION` during the Docker build, containing the UTC build timestamp in ISO 8601 format (e.g., `2024-01-15T10:30:00Z`).

To inspect it:
```bash
docker run --rm horse-api-kx1qu cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application. Environment-specific configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
