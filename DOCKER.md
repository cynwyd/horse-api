# Docker Instructions — horse-api-383u6

## Overview

A FastAPI-based REST API service running on Python 3 with Uvicorn as the ASGI server.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-383u6 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-383u6
```

The API will be available at: `http://localhost:8000`

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-383u6 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For sensitive configuration values, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for Kubernetes](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application (Uvicorn) |
