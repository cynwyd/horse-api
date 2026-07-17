# horse-api-movlr — Docker Build & Run Guide

## Overview

This document describes how to build and run the `horse-api-movlr` Docker image standalone, outside the automated pipeline.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Port:** 8000 (HTTP)

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) for the base image

---

## Build

The build context must be the root of the extracted source directory (where `Dockerfile`, `main.py`, `requirements.txt`, and `VERSION` reside).

```bash
# From the root of the extracted source archive:
docker build -t horse-api-movlr .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-movlr
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

No environment variables are required to start this application.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
