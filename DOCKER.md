# Docker Instructions — horse-api

## Overview

A FastAPI application served by Uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp (UTC) is written to `/app/VERSION` at image build time.

## Prerequisites

- Docker installed and running

## Build

Run the following command from the **root of the repository** (the directory containing the `Dockerfile`):

```bash
# From the root of the extracted source directory:
docker build -t horse-api .
```

## Run

```bash
docker run -p 8000:8000 horse-api
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

This prints the UTC timestamp recorded at image build time (e.g., `2024-06-25T18:47:23Z`).

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are needed in future, use:
- **ECS**: [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Port

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
