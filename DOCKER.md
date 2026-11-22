# Docker Instructions — horse-api-i65cx

## Overview

A FastAPI Python web service served by Uvicorn, exposing a REST API on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-i65cx .
```

## Run

```bash
docker run -p 8000:8000 horse-api-i65cx
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

No environment variables are required for this application. All configuration is handled via ECS task definitions or Kubernetes manifests in the deployment pipeline.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-i65cx cat /app/VERSION
```

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces inside the container.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
