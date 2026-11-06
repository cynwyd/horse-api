# horse-api-qnfvs — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3.9
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Exposed Port:** 8000
- **Service Name:** horse-api-qnfvs

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qnfvs .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-qnfvs .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-qnfvs
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

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-qnfvs cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at the framework level.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are embedded in the image.
- For production deployments on ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secrets as environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
