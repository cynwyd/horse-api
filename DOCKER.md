# Docker Instructions — horse-api-wpti6

## Overview

This is a FastAPI-based REST API containerized using Amazon Linux 2023 and served by uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-wpti6 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-wpti6
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

## Verify VERSION file

```bash
docker run --rm horse-api-wpti6 cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the image.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
