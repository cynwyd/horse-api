# Docker Instructions — horse-api-0v235

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single endpoint at `/` returning a health/greeting response.

## Prerequisites

- Docker installed and running
- Internet access to pull the base image (`public.ecr.aws/amazonlinux/amazonlinux:2023`)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0v235 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-0v235
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required for this application.

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- No secrets or credentials are required.
- For production deployments on ECS or EKS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to manage any future secret environment variables.
