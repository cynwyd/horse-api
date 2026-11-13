# Docker Instructions — horse-api-8ytuf

## Overview

A minimal FastAPI HTTP API served by uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI
- **Service Name:** `horse-api-8ytuf`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-8ytuf .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-8ytuf
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the build. To inspect it:

```bash
docker run --rm horse-api-8ytuf cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For secret management in production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |
