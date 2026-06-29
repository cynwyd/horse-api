# Docker Instructions — horse-api-0lv1r

## Overview

This is a FastAPI application served by uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0lv1r .
```

## Run

```bash
docker run -p 8000:8000 horse-api-0lv1r
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

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp.

```bash
docker run --rm horse-api-0lv1r cat /app/VERSION
```

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Port

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |
