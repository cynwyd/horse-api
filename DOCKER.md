# Docker Instructions — horse-api-m4esu

## Overview

This document describes how to build and run the `horse-api-m4esu` Docker image standalone, outside the automated pipeline.

- **Language:** Python 3
- **Framework:** FastAPI
- **Runtime:** Uvicorn
- **Port:** 8000 (HTTP)
- **Service Name:** horse-api-m4esu

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-m4esu .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-m4esu
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

The application exposes a health endpoint at `/`:

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-m4esu cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled via ECS task definitions or Kubernetes manifests in production.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
