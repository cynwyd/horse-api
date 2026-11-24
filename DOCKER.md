# Docker Instructions — horse-api-d5zaz

## Overview

This is a FastAPI application served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-d5zaz`
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build time

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-d5zaz .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-d5zaz
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

Check the VERSION file inside the container:
```bash
docker run --rm horse-api-d5zaz cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application.

---

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
