# Docker Instructions — horse-api (service-name-qyk60)

## Overview

A FastAPI-based REST API served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t service-name-qyk60 .
```

## Run

```bash
docker run -p 8000:8000 service-name-qyk60
```

## Verify

Once running, the application is accessible at:

- **Health check:** `http://localhost:8000/`
- **API docs (Swagger UI):** `http://localhost:8000/docs`
- **OpenAPI schema:** `http://localhost:8000/openapi.json`

Expected response from `GET /`:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm service-name-qyk60 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is handled at the framework level.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
