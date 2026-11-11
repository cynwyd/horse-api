# horse-api-uriem — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Uvicorn. The container listens on port `8000` and binds to `0.0.0.0` to accept connections from all interfaces.

A `VERSION` file is generated at build time containing the UTC timestamp of when the image was built.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws/amazonlinux/amazonlinux:2023` (public, no authentication required)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-uriem .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-uriem
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

No environment variables are required to start the application. The following can be optionally provided at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none currently defined)* | | |

---

## Exposed Ports

| Port | Protocol | Description |
|---|---|---|
| `8000` | HTTP | FastAPI application served by Uvicorn |

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC build timestamp (e.g., `2024-01-15T10:30:00Z`). To inspect it:

```bash
docker run --rm horse-api-uriem cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
