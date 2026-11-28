# Docker Build & Run Instructions — horse-api-8bjeh

## Overview

| Property       | Value                          |
|----------------|-------------------------------|
| Service Name   | `horse-api-8bjeh`             |
| Language       | Python 3                      |
| Framework      | FastAPI + uvicorn             |
| Exposed Port   | `8000` (HTTP)                 |
| Health Check   | `GET /` → HTTP 200            |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-8bjeh .
```

## Run

```bash
docker run -p 8000:8000 horse-api-8bjeh
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:

```bash
docker run --rm horse-api-8bjeh cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Notes

- The container runs as a non-root user (`appuser`) for security.
- uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
