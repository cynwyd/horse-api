# Docker Instructions — horse-api-uicg8

## Overview

A FastAPI-based HTTP API service served by Uvicorn, running on port **8000**.

The image includes a `VERSION` file at `/app/VERSION` containing the UTC timestamp of the build.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-uicg8 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-uicg8
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

No environment variables are required for this application to start. Any runtime configuration should be injected via ECS task definitions or Kubernetes pod specs.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp (ISO 8601 format).
