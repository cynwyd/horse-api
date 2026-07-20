# Docker Instructions — horse-api

## Overview

A FastAPI HTTP API served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is written to `/app/VERSION` at image build time.

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
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

To inspect the VERSION file inside the container:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-07-20T11:10:45Z
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## Secret Handling

For production deployments, manage any secrets via:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
