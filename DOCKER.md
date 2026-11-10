# Docker Instructions — horse-api-nge45

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **Service name:** `horse-api-nge45`

A `VERSION` file is generated at build time containing the UTC timestamp of the image build.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-nge45 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-nge45
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application.

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

## Notes

- The container runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
