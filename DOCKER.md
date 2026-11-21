# Docker Instructions — horse-api-nqhmr

## Overview

A FastAPI HTTP API service served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC ISO-8601) is written to `/app/VERSION` at image build time.

---

## Build

Run the following command from the **root of the extracted source directory** (the directory that contains the `Dockerfile`):

```bash
# From the root of the extracted source archive:
docker build -t horse-api-nqhmr .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-nqhmr
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Secrets Handling

For production deployments, manage any future secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager / KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## VERSION File

The image contains `/app/VERSION` with the UTC build timestamp in ISO-8601 format.

```bash
docker run --rm horse-api-nqhmr cat /app/VERSION
```
