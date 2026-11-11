# Docker Instructions — horse-api-z6pql

## Overview

A FastAPI-based REST API served by Uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp is included at `/app/VERSION` inside the image.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-z6pql .
```

## Run

```bash
docker run -p 8000:8000 horse-api-z6pql
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
docker run --rm horse-api-z6pql cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

## Environment Variables

No environment variables are required to start the application.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
