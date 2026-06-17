# Docker Instructions — horse-api-may1x

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a health endpoint at `/` and listens on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-may1x .
```

## Run

```bash
docker run -p 8000:8000 horse-api-may1x
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the build. To inspect it:

```bash
docker run --rm horse-api-may1x cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn)      |

## Health Check

- **Path:** `GET /`
- **Expected HTTP Status:** `200`

## Environment Variables

No environment variables are required to start this application. Any future configuration (e.g., database URLs, API keys) should be injected at runtime via:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The service name has the suffix `-may1x` applied: `horse-api-may1x`.
- No `index.js` was found in this repository; the hostname update instruction was not applicable.
