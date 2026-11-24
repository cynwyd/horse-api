# Docker Instructions — horse-api-5yc3e

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service name:** `horse-api-5yc3e`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Health check endpoint:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-5yc3e .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-5yc3e
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application. The following can be optionally overridden at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none currently required)* | | |

---

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

```bash
docker run --rm horse-api-5yc3e cat /app/VERSION
```

---

## Secret Handling

For production deployments, manage any future secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
