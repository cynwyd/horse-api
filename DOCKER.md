# Docker Instructions — horse-api-at5tl

## Overview

This is a Python FastAPI application containerized using Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-at5tl

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-at5tl .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-at5tl
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

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-at5tl cat /app/VERSION
```

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
