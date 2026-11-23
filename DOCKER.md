# Docker Instructions — horse-api-csn7q

## Overview

This is a FastAPI-based HTTP API service containerized with Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Port:** `8000`
- **Service Name:** `horse-api-csn7q`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-csn7q .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-csn7q
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

No environment variables are required to start the application. The following can be optionally configured at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none currently required)* | | |

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-csn7q cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any sensitive environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
