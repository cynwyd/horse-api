# Docker Instructions — horse-api-92nsw

## Overview

This is a FastAPI-based HTTP API service containerized on Amazon Linux 2023.

- **Language:** Python 3.9
- **Framework:** FastAPI 0.111.0 with Uvicorn 0.30.1
- **Port:** 8000 (HTTP)
- **Service Name:** horse-api-92nsw

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-92nsw .
```

## Run

```bash
docker run -p 8000:8000 horse-api-92nsw
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

A `VERSION` file is generated at image build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-92nsw cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- No `index.js` file was found in this repository; the hostname update instruction was not applicable.
