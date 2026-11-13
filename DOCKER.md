# Docker Build and Run Instructions

## Service Name
`horse-api-25fq3`

## Overview
A FastAPI-based HTTP API service running on Python 3 with uvicorn. Exposes a single `GET /` health endpoint.

## Prerequisites
- Docker installed and running

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-25fq3 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-25fq3
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

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-25fq3 cat /app/VERSION
```

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
