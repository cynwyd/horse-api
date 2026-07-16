# Docker Instructions — horse-api-cudjc

## Overview

A FastAPI Python web service exposing a health/status REST endpoint, served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-cudjc .
```

## Run

```bash
docker run -p 8000:8000 horse-api-cudjc
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

A `VERSION` file is included at `/app/VERSION` inside the image, containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-cudjc cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application to start. Configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
