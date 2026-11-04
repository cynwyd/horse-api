# Docker Instructions — horse-api-7hj8m

## Overview

A FastAPI-based HTTP API service running on Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Port:** `8000`
- **Service Name:** `horse-api-7hj8m`

---

## Build

Build the image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-7hj8m .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-7hj8m
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
docker run --rm horse-api-7hj8m cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

If secrets are needed in future, use the following managed approaches:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
