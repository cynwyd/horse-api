# Docker Instructions — horse-api-jbldf

## Overview

A minimal FastAPI HTTP API served by uvicorn. Exposes a single `GET /` health endpoint.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** uvicorn
- **Port:** 8000

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jbldf .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jbldf
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

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-jbldf cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secret environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
