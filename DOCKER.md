# horse-api-p82so — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-p82so`
- **Port:** `8000`
- **Health check endpoint:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-p82so .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-p82so
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-p82so cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration uses built-in defaults.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
