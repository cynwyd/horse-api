# Docker Instructions — horse-api-duhp3

## Overview

A minimal FastAPI HTTP API served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Base Image:** Amazon Linux 2023

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-duhp3 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-duhp3
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-duhp3 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |
