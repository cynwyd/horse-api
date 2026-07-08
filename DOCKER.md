# Docker Instructions — horse-api-dts5x

## Overview

A Python FastAPI application served by uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-dts5x .
```

## Run

```bash
docker run -p 8000:8000 horse-api-dts5x
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```
GET http://localhost:8000/
```

Expected response: `200 OK`

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file in the image contains the build timestamp.
- For secret management in production, use:
  - **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
