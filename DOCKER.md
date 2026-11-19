# Docker Instructions — horse-api-l1hxg

## Overview

A FastAPI-based REST API served by uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-l1hxg

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-l1hxg .
```

## Run

```bash
docker run -p 8000:8000 horse-api-l1hxg
```

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-l1hxg cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
