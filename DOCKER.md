# horse-api — Docker Build & Run Instructions

## Overview

A lightweight FastAPI HTTP API served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is written to `/app/VERSION` at image build time.

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

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Verify VERSION File

To inspect the build timestamp embedded in the image:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-06-29T23:59:51Z
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI / Uvicorn server |
