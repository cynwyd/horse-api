# Docker Build and Run Instructions

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

## Prerequisites

- Docker installed and running

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-kcn7i .
```

## Run

```bash
docker run -p 8000:8000 horse-api-kcn7i
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

## Verify VERSION file

```bash
docker run --rm horse-api-kcn7i cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
