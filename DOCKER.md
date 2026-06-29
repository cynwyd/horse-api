# Docker Instructions — horse-api-9m201

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

## Build

Build the Docker image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-9m201 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-9m201
```

## Verify

Once running, the application is accessible at:

```
http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start this application.

## Secret Handling

If secrets are needed in the future, use the following AWS-native approaches:

- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## VERSION File

The `VERSION` file in the image contains the build timestamp used during containerization.
