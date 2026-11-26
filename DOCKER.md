# Docker Build & Run Instructions — horse-api-adew9

## Overview

| Property | Value |
|---|---|
| **Service Name** | `horse-api-adew9` |
| **Language** | Python 3.9 |
| **Framework** | FastAPI `0.111.0` |
| **ASGI Server** | Uvicorn `0.30.1` |
| **Exposed Port** | `8000` (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |
| **Run As** | `appuser` (non-root) |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-adew9 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-adew9
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-adew9 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are introduced in future versions, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
