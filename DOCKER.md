# Docker Build & Run Instructions

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-53o1e .
```

## Run

```bash
docker run -p 8000:8000 horse-api-53o1e
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

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-53o1e cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are introduced in future versions, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
