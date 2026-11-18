# horse-api — Docker Build & Run Instructions

## Overview

A minimal FastAPI HTTP API served by Uvicorn. The image includes a `VERSION` file at `/app/VERSION` containing the UTC timestamp of when the image was built.

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

## Run

```bash
docker run --rm -p 8000:8000 horse-api
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

## Verify VERSION File

```bash
docker run --rm horse-api cat /app/VERSION
```

This prints the UTC build timestamp (e.g., `2024-01-15T10:30:00Z`).

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Secret Handling

If secrets are needed in future iterations, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
