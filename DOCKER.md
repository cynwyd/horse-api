# Docker Build and Run Instructions

## Overview

This is a Python FastAPI application served by Uvicorn. The image is named `horse-api-wjmg9` and runs on port `8000`.

A `VERSION` file containing the UTC build timestamp is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-wjmg9 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-wjmg9
```

The application will be available at: [http://localhost:8000](http://localhost:8000)

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

No required environment variables. The application runs with defaults.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- The `/app/VERSION` file inside the container contains the UTC timestamp of when the image was built.
- For secret management in ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For secret management in EKS, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
