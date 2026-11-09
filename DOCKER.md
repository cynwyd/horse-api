# Docker Instructions — horse-api-3f7uh

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-3f7uh`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3f7uh .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-3f7uh
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application. The following can be optionally provided at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none currently defined)* | | |

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

## Version

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

```bash
docker run --rm horse-api-3f7uh cat /app/VERSION
```

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
