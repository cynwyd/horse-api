# Docker Instructions — horse-api-rnn44

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

- **Service Name:** `horse-api-rnn44`
- **Language:** Python 3
- **Framework:** FastAPI `0.111.0`
- **ASGI Server:** Uvicorn `0.30.1`
- **Exposed Port:** `8000`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-rnn44 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-rnn44
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-rnn44 cat /app/VERSION
```

## Environment Variables

| Variable       | Description                  | Default          |
|----------------|------------------------------|------------------|
| `SERVICE_NAME` | Logical name of the service  | `horse-api-rnn44` |

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- No external dependencies (database, cache, message broker) are required to start the service.
- For secret management in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
