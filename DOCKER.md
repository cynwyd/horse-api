# Docker Build & Run Instructions

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` inside the image at build time.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
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
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

### Check the VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI / Uvicorn server |

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
