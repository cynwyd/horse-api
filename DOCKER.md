# Docker Build & Run Instructions — horse-api

## Overview

A FastAPI application served by Uvicorn on port **8000**.  
A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` at image build time.

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

---

## Verify

```bash
# Health check
curl http://localhost:8000/

# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}

# Check the VERSION file inside the container
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-11-10T13:10:52Z
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required for this application.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
