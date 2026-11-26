# Docker Instructions — horse-api-6tx68

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-6tx68 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-6tx68
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

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the image.

---

## Secret Handling

For sensitive configuration values, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Inspect VERSION file

```bash
docker run --rm horse-api-6tx68 cat /app/VERSION
```

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn)      |
