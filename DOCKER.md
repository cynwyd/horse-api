# Docker Instructions — horse-api-gs5o3

## Overview

This is a Python FastAPI application served by uvicorn on port `8000`.

- **Service Name:** `horse-api-gs5o3`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** `8000`
- **Health Check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-gs5o3 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-gs5o3
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

No environment variables are required to start the application. The following can be optionally overridden at runtime via ECS task definition or Kubernetes pod spec:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-gs5o3 cat /app/VERSION
```

---

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Logs are written to stdout/stderr — compatible with ECS CloudWatch Logs and EKS logging.
- The `service-name` Docker label is set to `horse-api-gs5o3`.
