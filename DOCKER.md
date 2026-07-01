# Docker Instructions — horse-api-liog1

## Overview

A FastAPI-based horse API service containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** 8000 (HTTP)
- **Health Check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-liog1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-liog1
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

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-liog1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
