# Docker Build and Run Instructions

## Overview

This is a FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file containing the UTC build timestamp is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Verify VERSION File

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required.
- For production deployments on ECS or EKS, use AWS Secrets Manager to inject any future secrets as environment variables:
  - [ECS Secrets via Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - [EKS Secrets via Secrets Manager or KMS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
