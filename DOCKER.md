# Docker Instructions — horse-api-bniek

## Overview

A FastAPI Python web service exposing a REST API with a health check endpoint.

- **Service Name:** `horse-api-bniek`
- **Language:** Python 3.9
- **Framework:** FastAPI + uvicorn
- **Port:** `8000`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bniek .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bniek
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

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-bniek cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application.

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
