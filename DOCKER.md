# Docker Instructions — horse-api-bsw99

## Overview

This is a FastAPI application served by Uvicorn on port `8000`, containerized on Amazon Linux 2023.

A `VERSION` file is generated at build time (`/app/VERSION`) containing the UTC timestamp of the image build.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-bsw99 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bsw99
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

No environment variables are required for this application.

---

## Secrets Handling

If secrets are needed in future iterations, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp.
- Uvicorn listens on `0.0.0.0:8000` for container compatibility.
