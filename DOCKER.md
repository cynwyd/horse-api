# Docker Instructions — horse-api-c8npp

## Overview

This is a FastAPI application served via uvicorn, containerized on Amazon Linux 2023.

- **Port:** `8000`
- **Health check endpoint:** `GET /` → HTTP 200
- **Run user:** `appuser` (non-root)
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-c8npp .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-c8npp
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application. All configuration is handled via ECS task definitions or equivalent IaC.

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

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
