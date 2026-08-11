# Docker Instructions — horse-api

## Overview

A lightweight FastAPI REST API served by uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp (UTC) is written to `/app/VERSION` at image build time.

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

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

## Environment Variables

No environment variables are required for this application.

---

## Health Check

| Method | Path | Expected Status |
|--------|------|-----------------|
| GET    | `/`  | `200 OK`        |

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
docker run --rm horse-api cat /app/VERSION
```

---

## Secret Handling

This application has no secrets. For future secret management in AWS:

- **ECS**: Use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject secrets as environment variables in the task definition.
- **EKS**: Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
