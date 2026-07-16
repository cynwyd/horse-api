# Docker Instructions — horse-api-lbyrw

## Overview

This is a Python FastAPI application served by uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** 8000 (HTTP)
- **Service Name:** horse-api-lbyrw

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lbyrw .
```

## Run

```bash
docker run -p 8000:8000 horse-api-lbyrw
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

A `VERSION` file is generated at build time containing the UTC timestamp of when the image was built. It is located at `/app/VERSION` inside the container.

To inspect it:
```bash
docker run --rm horse-api-lbyrw cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
