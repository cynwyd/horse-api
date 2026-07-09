# horse-api-4mwos — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.
The image is built on Amazon Linux 2023 and runs as a non-root user (`appuser`).
A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Internet access to pull the base image from `public.ecr.aws`

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-4mwos .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-4mwos
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
| 8000 | HTTP     | FastAPI application via uvicorn    |

---

## Environment Variables

No environment variables are required to start this application.

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-4mwos cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
