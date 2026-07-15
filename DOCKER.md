# horse-api — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API served by Uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

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
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

Check the embedded VERSION file:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-07-15T20:38:14Z
```

---

## Environment Variables

No environment variables are required to run this application. All runtime configuration can be injected via ECS task definitions or Kubernetes manifests as needed.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS**: [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |
