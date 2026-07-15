# horse-api — Docker Build & Run Instructions

## Overview

A minimal FastAPI service served by Uvicorn, containerized on Amazon Linux 2023.
The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (public ECR, no authentication required)

---

## Build

Run the following command from the **root of the extracted source directory** (where `Dockerfile` resides):

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
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

Check the build timestamp embedded in the image:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-07-15T17:10:45Z
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
