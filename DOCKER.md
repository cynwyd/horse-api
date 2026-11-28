# Docker Instructions — horse-api-b9jwk

## Overview

A FastAPI Python web service exposing a single HTTP endpoint. The application is served by Uvicorn on port **8000** and binds to all interfaces (`0.0.0.0`) for container compatibility.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-b9jwk .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-b9jwk
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

## Check VERSION File

```bash
docker run --rm horse-api-b9jwk cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For secret handling in production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |
