# Docker Instructions — horse-api-niato

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI `0.111.0`
- **ASGI Server:** Uvicorn `0.30.1`
- **Service Name:** `horse-api-niato`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-niato .
```

## Run

```bash
docker run -p 8000:8000 horse-api-niato
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-niato cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
