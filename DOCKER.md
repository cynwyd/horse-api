# Docker Instructions — horse-api-7be6l

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** `8000`
- **Service Name:** `horse-api-7be6l`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7be6l .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-7be6l
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

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp in ISO 8601 UTC format.

To inspect it:
```bash
docker run --rm horse-api-7be6l cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
