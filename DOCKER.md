# Docker Instructions — horse-api-j62k2

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** `8000`
- **Service Name:** `horse-api-j62k2`

## Build

Run the following command from the root of the extracted source directory:

```bash
docker build -t horse-api-j62k2 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-j62k2
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

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` and contains the UTC timestamp of the image build time (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-j62k2 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. The following can optionally be provided at runtime via ECS task definitions or Kubernetes manifests:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

## Secret Handling

For production deployments, manage any future secrets using:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
