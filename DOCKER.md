# Docker Instructions — horse-api-qouxy

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file is generated at build time containing the UTC timestamp of the build.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qouxy .
```

## Run

```bash
docker run -p 8000:8000 horse-api-qouxy
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

No environment variables are required to start the application.

## Secrets Handling

If secrets are needed in future (e.g., API keys, database credentials), use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The image includes a `/app/VERSION` file containing the UTC build timestamp (e.g., `2024-06-18T09:25:31Z`). To inspect it:

```bash
docker run --rm horse-api-qouxy cat /app/VERSION
```
