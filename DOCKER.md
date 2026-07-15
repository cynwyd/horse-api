# horse-api — Docker Build & Run Guide

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

The build context must be the root of the extracted source directory (where `main.py` and `requirements.txt` reside).

```bash
# From the root of the extracted source directory:
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api .
```

> **Note:** The `BUILD_TIMESTAMP` build argument is used to write a `VERSION` file (`/app/VERSION`) into the image at build time. Pass any timestamp string you prefer; the example above uses the current UTC time in ISO 8601 format.

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

### Health check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

### Verify the VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. All configuration is handled at the ECS task definition or Kubernetes deployment level.

---

## Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## Secret Handling

For production deployments, manage secrets using:

- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
