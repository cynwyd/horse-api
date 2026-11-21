# Docker Instructions — horse-api-8qxfo

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file is generated at build time containing the UTC timestamp of when the image was built. It is located at `/app/VERSION` inside the container.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-8qxfo .
```

## Run

```bash
docker run -p 8000:8000 horse-api-8qxfo
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

No environment variables are required to run this application. All configuration is handled via ECS task definitions or Kubernetes manifests in production.

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp in ISO 8601 UTC format.
- No `index.js` was found in this repository; the hostname update instruction was not applicable.
