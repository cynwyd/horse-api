# Docker Build and Run Instructions

## Overview

**Service Name:** horse-api-7qz1k  
**Language:** Python 3  
**Framework:** FastAPI (served by Uvicorn)  
**Port:** 8000  

## Prerequisites

- Docker installed and running
- Access to the source repository root directory

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7qz1k .
```

## Run

```bash
docker run -p 8000:8000 horse-api-7qz1k
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

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp in ISO 8601 UTC format. To inspect it:

```bash
docker run --rm horse-api-7qz1k cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is handled at the ECS task definition or Kubernetes deployment level.

## Secret Handling

If secrets are needed in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
