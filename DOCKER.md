# Docker Instructions — horse-api

## Overview

A minimal FastAPI application served by Uvicorn on port 8000.  
A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` at image build time.

## Build

Run the following command from the root of the extracted source directory:

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
# Example output: 2024-07-01T10:53:49Z
```

## Environment Variables

No environment variables are required to run this application.

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI / Uvicorn server |

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments, manage any secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
