# Docker Instructions — horse-api-43uam

## Overview

A minimal FastAPI HTTP API served by uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** uvicorn
- **Port:** `8000`
- **Health Check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-43uam .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-43uam
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

No environment variables are required for this application.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS:** [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The `VERSION` file contains the build timestamp and is included in the image at `/app/VERSION`.
- The application runs as a non-root user (`appuser`) for security.
