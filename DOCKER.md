# Docker Instructions — horse-api-djcfk

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC).

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-djcfk .
```

## Run

```bash
docker run -p 8000:8000 horse-api-djcfk
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

No environment variables are required to start the application. All configuration is provided at runtime via ECS task definitions or Kubernetes manifests.

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## VERSION File

The image contains a `/app/VERSION` file with the UTC build timestamp:

```bash
docker run --rm horse-api-djcfk cat /app/VERSION
```

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
