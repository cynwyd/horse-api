# Docker Instructions — horse-api-y9k69

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3.9
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Exposed Port:** 8000
- **Service Name:** horse-api-y9k69

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-y9k69 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-y9k69
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

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-y9k69 cat /app/VERSION
```

## Environment Variables

No required environment variables. The application runs with defaults.

For secret handling in production deployments:
- **ECS:** Use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject secrets via ECS task definitions.
- **EKS:** Use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for Kubernetes secret management.
