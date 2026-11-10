# Docker Build & Run Instructions — horse-api-icvz6

## Overview

| Property | Value |
|---|---|
| **Service Name** | `horse-api-icvz6` |
| **Language** | Python 3 |
| **Framework** | FastAPI (uvicorn) |
| **Port** | `8000` |
| **Base Image** | `public.ecr.aws/amazonlinux/amazonlinux:2023` |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-icvz6 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-icvz6
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

## Environment Variables

No environment variables are required to start this application. All runtime configuration is provided via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-icvz6 cat /app/VERSION
```
