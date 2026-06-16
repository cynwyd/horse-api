# Docker Instructions — horse-api-pdmf7

## Overview

**Service name:** `horse-api-pdmf7`  
**Language:** Python 3  
**Framework:** FastAPI  
**Port:** `8000` (HTTP)  
**Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-pdmf7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-pdmf7
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

| Endpoint | Method | Expected Response |
|---|---|---|
| `/` | GET | `200 OK` |

---

## Environment Variables

No environment variables are required to start the application. If needed in future, inject them via:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api-pdmf7
```

For production deployments on **ECS**, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to handle any secret environment variables.  
For **EKS**, use [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-pdmf7 cat /app/VERSION
```

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn listens on `0.0.0.0:8000` to accept connections from all interfaces.
