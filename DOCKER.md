# Docker Instructions — horse-api-roi5n

## Overview

A Python FastAPI application served by Uvicorn on port `8000`.

| Property        | Value                                      |
|-----------------|--------------------------------------------|
| Base Image      | `public.ecr.aws/amazonlinux/amazonlinux:2023` |
| Language        | Python 3                                   |
| Framework       | FastAPI 0.111.0                            |
| ASGI Server     | Uvicorn 0.30.1                             |
| Exposed Port    | `8000`                                     |
| Service Name    | `horse-api-roi5n`                          |
| Run User        | `appuser` (non-root)                       |

---

## Build

From the root of the extracted source archive:

```bash
docker build -t horse-api-roi5n .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-roi5n
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

## VERSION File

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-roi5n cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. External dependencies (databases, secrets, etc.) should be injected at runtime via ECS task definitions or Kubernetes manifests.

### Secret Handling Recommendations

For secrets (API keys, database credentials, etc.), use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
