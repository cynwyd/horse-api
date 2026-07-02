# Docker Instructions — horse-api-h3hix

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-h3hix .
```

## Run

```bash
docker run -p 8000:8000 horse-api-h3hix
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

No environment variables are required to start the application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
