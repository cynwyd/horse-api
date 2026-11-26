# Docker Instructions — horse-api

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.  
A `VERSION` file containing the UTC build timestamp is embedded in the image at `/app/VERSION`.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
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
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

To inspect the embedded VERSION file:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-11-26T02:49:00Z
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn) |

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
