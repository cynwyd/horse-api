# Docker Instructions — horse-api-04ihm

## Overview

A minimal FastAPI HTTP API service that returns health/status responses.

- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** 8000 (HTTP)
- **Service Name:** `horse-api-04ihm`

---

## Build

The build context must be the root of the extracted source directory.

```bash
# From the root of the extracted source archive:
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-04ihm \
  .
```

The `BUILD_TIMESTAMP` build argument is used to populate the `/app/VERSION` file inside the image. Pass the current timestamp at build time as shown above.

---

## Run

```bash
docker run -p 8000:8000 horse-api-04ihm
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

| Path | Method | Expected Response |
|------|--------|-------------------|
| `/`  | GET    | `200 OK`          |

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to run this application.

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp passed via `BUILD_TIMESTAMP` at build time.

```bash
# Inspect the VERSION file inside a running container:
docker run --rm horse-api-04ihm cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
