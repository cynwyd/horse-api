# Docker Build and Run Instructions

## Overview

**Service name:** horse-api-rg01u  
**Language:** Python 3  
**Framework:** FastAPI (served by Uvicorn)  
**Port:** 8000 (HTTP)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-rg01u .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-rg01u
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required for this application. All configuration is self-contained.

---

## Health Check

The application exposes a health endpoint at the root path:

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-rg01u cat /app/VERSION
```

---

## Secret Handling

This application has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
