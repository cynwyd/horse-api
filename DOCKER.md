# horse-api-l5igy — Docker Instructions

## Overview

A FastAPI-based HTTP API served by Uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Service Name:** `horse-api-l5igy`

---

## Build

The build context must be the root of the extracted source directory (where `Dockerfile` and `requirements.txt` reside).

```bash
# From the root of the extracted source archive:
docker build -t horse-api-l5igy .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-l5igy
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application. All configuration is self-contained.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
