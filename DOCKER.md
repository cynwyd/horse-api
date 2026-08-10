# Docker Instructions — horse-api-829n1

## Overview

A FastAPI HTTP API service served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-829n1`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-829n1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-829n1
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

A `VERSION` file is embedded in the image at `/app/VERSION` and contains the UTC timestamp of the image build time (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-829n1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
