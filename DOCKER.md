# Docker Build and Run Instructions

## Service Name
`horse-api-453yq`

## Overview
A FastAPI HTTP API served via uvicorn on port `8000`.

## Prerequisites
- Docker installed and running

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-453yq .
```

## Run

```bash
docker run -p 8000:8000 horse-api-453yq
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

No environment variables are required for this application.

## Secrets Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served via uvicorn |

## VERSION File

The `VERSION` file in the image contains the build timestamp and is located at `/app/VERSION`.
