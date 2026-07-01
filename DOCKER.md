# Docker Instructions — horse-api-o0dna

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC).

## Prerequisites

- Docker installed and running
- No external dependencies (no database, cache, or messaging service required)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-o0dna .
```

## Run

```bash
docker run -p 8000:8000 horse-api-o0dna
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The image contains a `/app/VERSION` file with the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-o0dna cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
