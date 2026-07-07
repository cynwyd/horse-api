# horse-api — Docker Build & Run Guide

## Overview

A minimal Python FastAPI service running on Uvicorn, containerized on Amazon Linux 2023.

A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` at image build time.

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
# Example output: 2024-07-07T22:30:55Z
```

---

## Environment Variables

No environment variables are required for this application.

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI / Uvicorn server |

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required at runtime.
- For production deployments on ECS or EKS, manage any future secrets via:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
