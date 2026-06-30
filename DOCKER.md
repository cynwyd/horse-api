# horse-api-bts5s — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bts5s .
```

## Run

```bash
docker run -p 8000:8000 horse-api-bts5s
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

## Environment Variables

No environment variables are required for this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## VERSION File

The image contains a `/app/VERSION` file with the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-bts5s cat /app/VERSION
```

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
