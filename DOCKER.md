# Docker Instructions — horse-api

## Overview

A minimal FastAPI HTTP API service served by Uvicorn on port **8000**.  
A `VERSION` file containing the UTC build timestamp is embedded at `/app/VERSION` inside the image.

---

## Build

Run the following command from the **root of the source directory** (the same directory that contains the `Dockerfile`):

```bash
# From the root of the extracted source directory:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Verify VERSION File

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-11-27T16:33:45Z
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled via ECS task definitions or Kubernetes manifests in the deployment pipeline.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Image Details

| Property | Value |
|---|---|
| Base Image | `public.ecr.aws/amazonlinux/amazonlinux:2023` |
| Language | Python 3.9 |
| Framework | FastAPI 0.111.0 |
| Server | Uvicorn 0.30.1 |
| Exposed Port | `8000` (HTTP) |
| Run User | `appuser` (non-root) |
| VERSION file | `/app/VERSION` (UTC build timestamp) |
