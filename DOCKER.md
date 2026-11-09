# Docker Instructions — horse-api-27nee

## Overview

This is a FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file is generated at build time containing the UTC timestamp of the build.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-27nee .
```

## Run

```bash
docker run -p 8000:8000 horse-api-27nee
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

## Verify VERSION file

```bash
docker run --rm horse-api-27nee cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
