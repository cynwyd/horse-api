# horse-api-jvh9c — Docker Build & Run Guide

## Overview

A lightweight FastAPI REST API served by Uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION` inside the image.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory** (where `Dockerfile` resides):

```bash
# From the root of the extracted source archive:
docker build -t horse-api-jvh9c .
```

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-jvh9c
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

## Inspect the VERSION file

```bash
docker run --rm horse-api-jvh9c cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application to start. All configuration is self-contained.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are embedded in the image.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
