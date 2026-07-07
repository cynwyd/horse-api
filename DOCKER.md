# horse-api — Docker Build & Run Guide

## Overview

A minimal Python FastAPI application served by uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is embedded in the image at `/app/VERSION`.

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

The image includes a `/app/VERSION` file with the UTC build timestamp:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-07-07T17:22:56Z
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

If secrets are needed in future, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn)      |
