# Docker Instructions — horse-api-63vbe

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn, served on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-63vbe .
```

## Run

```bash
docker run -p 8000:8000 horse-api-63vbe
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

## Environment Variables

No environment variables are required to start the application.

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-63vbe cat /app/VERSION
```

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
