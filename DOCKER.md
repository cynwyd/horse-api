# Docker Instructions — horse-api-p11z8

## Overview

This is a Python FastAPI application containerized with Amazon Linux 2023.

- **Service name:** `horse-api-p11z8`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** `8000`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-p11z8 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-p11z8
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

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret handling in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
