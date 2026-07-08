# Docker Instructions — horse-api-ke01v

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The application binds to `0.0.0.0:8000` and includes a `VERSION` file generated at build time containing the build timestamp.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ke01v .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ke01v
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Environment Variables

No environment variables are required to start the application.

---

## VERSION File

A `VERSION` file is generated at Docker build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-ke01v cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
