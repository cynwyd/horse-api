# horse-api-2g2rr — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

| Property        | Value                          |
|-----------------|-------------------------------|
| **Service Name**| horse-api-2g2rr               |
| **Language**    | Python 3                      |
| **Framework**   | FastAPI 0.111.0               |
| **ASGI Server** | Uvicorn 0.30.1                |
| **Port**        | 8000                          |
| **Base Image**  | Amazon Linux 2023             |

---

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-2g2rr .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-2g2rr
```

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

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production deployments, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
