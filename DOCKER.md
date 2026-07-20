# Docker Instructions — horse-api

## Overview

A FastAPI application served by Uvicorn on port 8000.  
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is written to `/app/VERSION` at image build time.

---

## Build

Run the following command from the root of the extracted source directory:

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
# Health check
curl http://localhost:8000/

# Check the VERSION file inside the container
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are baked into the image.
- For production deployments, manage any future secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
