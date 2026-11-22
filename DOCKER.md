# Docker Instructions — horse-api

## Overview

A FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file is generated at image build time and placed at `/app/VERSION`, containing the UTC timestamp of when the image was built (e.g. `2024-01-15T10:30:00Z`).

---

## Build

Run the following command from the root of the source directory (where the `Dockerfile` is located):

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
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Verify VERSION File

To inspect the build timestamp embedded in the image:

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
