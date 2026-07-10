# Docker Instructions — horse-api

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601 format) is written to `/app/VERSION` at image build time.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
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

No environment variables are required to run this application.

---

## Secrets Management

If secrets are needed in future, use:
- **ECS**: [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC build timestamp in ISO 8601 format (e.g., `2024-01-15T10:30:00Z`). To inspect it:

```bash
docker run --rm horse-api cat /app/VERSION
```
