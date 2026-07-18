# Docker Instructions — horse-api

## Overview

A minimal FastAPI application served by Uvicorn on port 8000.  
A `VERSION` file containing the build timestamp (UTC ISO-8601) is written to `/app/VERSION` at image build time.

## Build

Run from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
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
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

## Verify VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-07-18T12:40:00Z
```

## Environment Variables

No environment variables are required to run this application.

For secret management in production deployments:
- **ECS**: Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
