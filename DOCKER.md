# horse-api — Docker Build & Run Instructions

## Overview

A FastAPI HTTP API application served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- No external services required (no database, cache, or messaging dependencies)

---

## Build

Run the following command from the **root of the extracted source directory**:

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
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

### Check the VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
