# Docker Instructions — horse-api-lqwzr

## Overview

A minimal FastAPI HTTP API served by Uvicorn. The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lqwzr .
```

## Run

```bash
docker run -p 8000:8000 horse-api-lqwzr
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

## Verify VERSION File

```bash
docker run --rm horse-api-lqwzr cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- The service name includes the suffix `-lqwzr` as requested.
