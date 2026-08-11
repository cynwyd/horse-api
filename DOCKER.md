# horse-api — Docker Build & Run Guide

## Overview

A minimal Python FastAPI application served by uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is embedded at `/app/VERSION` inside the image.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

### Verify the VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Health Check

| Method | Path | Expected Status |
|--------|------|-----------------|
| GET    | `/`  | 200 OK          |

Example:
```bash
curl http://localhost:8000/
# {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required at runtime.
- If secrets are needed in future, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
