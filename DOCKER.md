# Docker Instructions — horse-api-61nax

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-61nax`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-61nax .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-61nax
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

Check the VERSION file inside the container:

```bash
docker run --rm horse-api-61nax cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application.

---

## Secret Handling

If secrets are needed in future (e.g., API keys, database credentials), use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

Do **not** hardcode secrets in the Dockerfile or source code.
