# Docker Build and Run Instructions

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-76tz3`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-76tz3 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-76tz3
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

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the image, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-76tz3 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are needed in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
