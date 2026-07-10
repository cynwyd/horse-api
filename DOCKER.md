# Docker Instructions — horse-api-jq14n

## Overview

This is a Python FastAPI application containerized using Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-jq14n

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jq14n .
```

## Run

```bash
docker run -p 8000:8000 horse-api-jq14n
```

## Health Check

The application exposes a health endpoint at:

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-jq14n cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
