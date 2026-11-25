# Docker Instructions — horse-api-ahq92

## Overview

A minimal FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** `8000`
- **Service Name:** `horse-api-ahq92`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ahq92 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ahq92
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-ahq92 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at the ECS task definition or Kubernetes deployment level.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
