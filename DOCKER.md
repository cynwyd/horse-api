# horse-api — Docker Build & Run Instructions

## Overview

A FastAPI application served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

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

---

## Verify

```bash
curl http://localhost:8000/
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

To inspect the embedded VERSION file:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-07-20T13:55:45Z
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn) |

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required at runtime.
- If secrets are needed in future, use:
  - **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
