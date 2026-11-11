# Docker Instructions — horse-api-zhlvu

## Overview

A FastAPI HTTP API service served by Uvicorn, running on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Service Name:** horse-api-zhlvu

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-zhlvu .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-zhlvu
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

No environment variables are required to start the application.

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-zhlvu cat /app/VERSION
```

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
