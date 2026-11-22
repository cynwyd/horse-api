# Docker Instructions — horse-api-1nrkw

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Service Name:** horse-api-1nrkw

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1nrkw .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1nrkw
```

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-1nrkw cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application.

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
