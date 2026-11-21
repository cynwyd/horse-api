# Docker Instructions — horse-api-ufm5j

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service name:** `horse-api-ufm5j`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ufm5j .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ufm5j
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-ufm5j cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
