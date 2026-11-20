# Docker Instructions — horse-api-j0pk6

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-j0pk6 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-j0pk6
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

No environment variables are required to start this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- No `index.js` file was found in this repository — the application is Python-only (FastAPI). The instruction to update `index.js` hostname was not applicable.
