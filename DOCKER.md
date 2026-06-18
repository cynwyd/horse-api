# Docker Instructions — horse-api

## Overview

A minimal Python FastAPI application served by uvicorn on port 8000.

## Prerequisites

- Docker installed and running

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

## Run

```bash
docker run -p 8000:8000 horse-api
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

No environment variables are required for this application.

## Secret Handling

If secrets are introduced in future versions, use the following approaches:

- **Amazon ECS**: Inject secrets via [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) in the ECS task definition.
- **Amazon EKS**: Use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) via Kubernetes secrets.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |
