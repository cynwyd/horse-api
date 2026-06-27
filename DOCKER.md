# horse-api-bhj0m — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

| Property        | Value                          |
|-----------------|-------------------------------|
| **Service Name**| horse-api-bhj0m               |
| **Language**    | Python 3                      |
| **Framework**   | FastAPI 0.111.0               |
| **ASGI Server** | Uvicorn 0.30.1                |
| **Port**        | 8000                          |
| **Base Image**  | Amazon Linux 2023             |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bhj0m .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bhj0m
```

---

## Health Check

The application exposes a health endpoint at the root path:

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS**: [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
