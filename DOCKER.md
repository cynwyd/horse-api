# horse-api — Docker Build & Run Guide

## Overview

A minimal FastAPI REST API served by Uvicorn on port **8000**.

A `VERSION` file is created at `/app/VERSION` during the image build, containing the UTC timestamp of when the image was built (ISO 8601 format).

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

Check the VERSION file inside the container:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-07-17T00:26:55Z
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## Health Check

| Path | Method | Expected Status |
|------|--------|-----------------|
| `/`  | GET    | 200             |

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For production deployments on ECS or EKS, environment variables and secrets should be injected via the task/pod definition rather than baked into the image.
  - **ECS**: Use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: Use [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
