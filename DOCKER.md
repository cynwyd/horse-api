# Docker Instructions — horse-api-sk98v

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-sk98v .
```

## Run

```bash
docker run -p 8000:8000 horse-api-sk98v
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

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-sk98v cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any future configuration
should be injected via ECS task definitions or Kubernetes pod specs — do **not** hardcode
secrets in the Dockerfile.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
