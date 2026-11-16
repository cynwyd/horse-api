# Docker Instructions — horse-api-b0fu0

## Overview

A FastAPI HTTP API service served by Uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Service Name:** `horse-api-b0fu0`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-b0fu0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-b0fu0
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

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the build.

To inspect it:
```bash
docker run --rm horse-api-b0fu0 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for the application to start.

For secret handling in production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
