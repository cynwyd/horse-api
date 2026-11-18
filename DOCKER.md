# Docker Build & Run Instructions — horse-api

## Overview

A minimal Python FastAPI service running on uvicorn, exposing a single `GET /` health/status endpoint on port `8000`. A `VERSION` file containing the build timestamp (UTC) is written into the image at `/app/VERSION` during the build.

## Prerequisites

- Docker installed and running
- No external dependencies (no database, cache, or messaging service required)

## Build

Run the following command from the root of the source directory (where the `Dockerfile` is located):

```bash
# From the root of the extracted source directory:
docker build -t horse-api .
```

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Verify

```bash
curl http://localhost:8000/
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-11-18T21:02:55Z
```

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required.
- For production deployments on ECS or EKS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secret environment variables securely.
