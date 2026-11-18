# Docker Instructions — horse-api-pt8u7

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

| Property       | Value                          |
|----------------|-------------------------------|
| Service Name   | `horse-api-pt8u7`             |
| Language       | Python 3                      |
| Framework      | FastAPI                       |
| ASGI Server    | Uvicorn                       |
| Exposed Port   | `8000`                        |
| Base Image     | `public.ecr.aws/amazonlinux/amazonlinux:2023` |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-pt8u7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-pt8u7
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

No environment variables are required for this application.

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-pt8u7 cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, use AWS Secrets Manager to manage any future secrets:
  - [ECS Secrets via Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - [EKS Secrets via Secrets Manager / KMS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
