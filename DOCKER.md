# Docker Instructions — horse-api-lmo7u

## Overview

This is a FastAPI-based REST API service containerized with Python 3 on Amazon Linux 2023.

- **Service Name:** `horse-api-lmo7u`
- **Framework:** FastAPI
- **Runtime:** Python 3 / uvicorn
- **Exposed Port:** `8000`
- **Health Check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lmo7u .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-lmo7u
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

No environment variables are required for this application. All configuration is handled via ECS task definitions or Kubernetes manifests.

---

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
