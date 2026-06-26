# Docker Instructions — horse-api-zfml3

## Overview

| Item | Detail |
|---|---|
| **Service Name** | `horse-api-zfml3` |
| **Language** | Python 3 |
| **Framework** | FastAPI + Uvicorn |
| **Port** | `8000` (HTTP) |
| **Health Check** | `GET /` → `200 OK` |

## Build

Run from the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-zfml3 \
  .
```

## Run

```bash
docker run -p 8000:8000 horse-api-zfml3
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp passed via the `BUILD_TIMESTAMP` build argument. To inspect it:

```bash
docker run --rm horse-api-zfml3 cat /app/VERSION
```

## Secret Handling

No secrets are required for this application. If secrets are added in the future, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
