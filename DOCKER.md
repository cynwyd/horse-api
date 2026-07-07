# horse-api-iwhir — Docker Instructions

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the build.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-iwhir .
```

## Run

```bash
docker run -p 8000:8000 horse-api-iwhir
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Verify VERSION File

```bash
docker run --rm horse-api-iwhir cat /app/VERSION
```

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
