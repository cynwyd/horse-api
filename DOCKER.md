# Docker Instructions — horse-api-0lced

## Overview

A FastAPI REST API served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-0lced

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0lced .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-0lced
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

No required environment variables. The application runs standalone without external dependencies.

---

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-0lced cat /app/VERSION
```

---

## Secret Handling

For production deployments, use the following for managing secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
