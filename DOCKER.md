# horse-api-i584g — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The image includes a `VERSION` file containing the build timestamp.

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-i584g .
```

## Run

```bash
docker run -p 8000:8000 horse-api-i584g
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

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-i584g cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Secret Handling

If secrets are needed in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
