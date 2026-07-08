# horse-api-0ihsg — Docker Instructions

## Overview

A FastAPI-based HTTP API service served by Uvicorn, bound to `0.0.0.0:8000`.

A `VERSION` file is generated at image build time containing the UTC timestamp of the build.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-0ihsg .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-0ihsg
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

## Verify VERSION File

```bash
docker run --rm horse-api-0ihsg cat /app/VERSION
```

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Environment Variables

No environment variables are required to run this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments, manage any future secrets using:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
