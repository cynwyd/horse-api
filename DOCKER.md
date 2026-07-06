# Docker Instructions — horse-api-csldj

## Overview

A minimal FastAPI HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status JSON response.

- **Service name:** `horse-api-csldj`
- **Port:** `8000` (HTTP)
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-csldj .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-csldj
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

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` with the build timestamp.
- Logs are written to stdout, compatible with ECS/CloudWatch logging.
