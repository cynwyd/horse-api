# horse-api-kluyn — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-kluyn .
```

## Run

```bash
docker run -p 8000:8000 horse-api-kluyn
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

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-kluyn cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
