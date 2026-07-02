# Docker Build and Run Instructions — horse-api

## Overview

`horse-api` is a Python FastAPI application served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing `Dockerfile`, `main.py`, and `requirements.txt`):

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

Check the embedded VERSION file:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-07-01T23:58:44Z
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

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required for this application.
- If secrets are needed in future, use:
  - **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [AWS Secrets Manager / KMS for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
