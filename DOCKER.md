# Docker Instructions — horse-api-v0z0g

## Overview

A minimal FastAPI REST API served by Uvicorn. The image includes a `VERSION` file stamped with the build timestamp.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** `8000`
- **Service name:** `horse-api-v0z0g`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-v0z0g .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-v0z0g
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

## Environment Variables

No environment variables are required for this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-v0z0g cat /app/VERSION
```

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
