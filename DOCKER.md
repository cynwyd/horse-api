# horse-api-jv48e — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn, served on port `8000`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory** (where the `Dockerfile` is located):

```bash
# From the root of the extracted source archive:
docker build -t horse-api-jv48e .
```

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-jv48e
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

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-jv48e cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required for this service.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
