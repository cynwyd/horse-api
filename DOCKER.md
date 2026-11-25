# Docker Instructions — horse-api-jy2dr

## Overview

A lightweight FastAPI REST API served by uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** uvicorn
- **Exposed Port:** `8000`
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jy2dr .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jy2dr
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

No environment variables are required to run this application. All configuration is self-contained.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments, consider using:
  - **ECS:** [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) for any future secret environment variables.
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
