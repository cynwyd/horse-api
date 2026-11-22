# Docker Build & Run Instructions — horse-api

## Overview

A FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is generated at image build time and stored at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Inspect the VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
```

Example output:
```
2024-11-22T03:12:45Z
```

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## Environment Variables

No environment variables are required to run this application.

---

## Health Check

| Path | Method | Expected Status |
|------|--------|-----------------|
| `/`  | GET    | `200 OK`        |

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
