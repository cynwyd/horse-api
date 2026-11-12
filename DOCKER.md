# Docker Instructions — horse-api-43fai

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn, served on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-43fai .
```

## Run

```bash
docker run -p 8000:8000 horse-api-43fai
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

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-43fai cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For sensitive environment variables, use:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |
