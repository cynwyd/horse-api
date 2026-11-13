# Docker Instructions — horse-api-dhc9o

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-dhc9o .
```

## Run

```bash
docker run -p 8000:8000 horse-api-dhc9o
```

## Verify

Once running, the application is accessible at:

```
http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp.
- Uvicorn logs are written to stdout, compatible with ECS/CloudWatch logging.

## Secret Handling

If secrets are needed in future, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
