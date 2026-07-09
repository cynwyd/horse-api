# horse-api-25dsc — Docker Instructions

## Overview

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** `8000`
- **Service Name:** `horse-api-25dsc`

## Build

Run the following command from the root of the extracted source directory:

```bash
docker build -t horse-api-25dsc .
```

## Run

```bash
docker run -p 8000:8000 horse-api-25dsc
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application. All configuration is handled via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Files

| File | Description |
|---|---|
| `Dockerfile` | Container build instructions |
| `.dockerignore` | Files excluded from the build context |
| `VERSION` | Build timestamp |
| `main.py` | FastAPI application entry point |
| `requirements.txt` | Python dependencies |
