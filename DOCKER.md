# Docker Instructions — horse-api-y8je6

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The service binds to `0.0.0.0:8000` and includes a `VERSION` file generated at image build time.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-y8je6 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-y8je6
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

A `VERSION` file is generated at image build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-y8je6 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments, manage any sensitive configuration via:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets management on EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (via Secrets Manager or KMS encryption)
