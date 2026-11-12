# Docker Instructions — horse-api-4vp4h

## Overview

This is a FastAPI-based REST API service containerized with Amazon Linux 2023 and served by Uvicorn on port `8000`.

A `VERSION` file is generated at build time and embedded in the image at `/app/VERSION`, containing the UTC timestamp of when the image was built.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-4vp4h .
```

## Run

```bash
docker run -p 8000:8000 horse-api-4vp4h
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

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The image includes a `/app/VERSION` file with the build timestamp in ISO 8601 UTC format (e.g., `2024-01-15T10:30:00Z`). To inspect it:

```bash
docker run --rm horse-api-4vp4h cat /app/VERSION
```

## Secret Handling

This application has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
