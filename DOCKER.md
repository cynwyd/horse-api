# Docker Instructions — horse-api

## Overview

A FastAPI HTTP API served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` at image build time.

---

## Build

From the root of the extracted source directory:

```bash
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
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Verify VERSION File

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn logs are written to stdout, making them compatible with ECS/CloudWatch log collection.
- For secret management in ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For secret management in EKS, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
