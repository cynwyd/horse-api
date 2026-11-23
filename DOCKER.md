# Docker Instructions — horse-api-5is87

## Overview

A minimal FastAPI application served by uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** uvicorn (ASGI)
- **Service Name:** `horse-api-5is87`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-5is87 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-5is87
```

The application will be available at: [http://localhost:8000](http://localhost:8000)

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

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-5is87 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
