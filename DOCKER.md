# Docker Instructions — horse-api-qqb5y

## Overview

A lightweight FastAPI REST API served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Service Name:** `horse-api-qqb5y`
- **Port:** `8000`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qqb5y .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-qqb5y
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-qqb5y cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application to start. Configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
