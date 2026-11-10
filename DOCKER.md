# Docker Instructions — horse-api-qdp0q

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service listens on port `8000` and binds to `0.0.0.0` for container compatibility.

A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qdp0q .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-qdp0q
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

No environment variables are required to start the application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

---

## Secret Handling

No secrets are required for this application. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- The service name includes the suffix `-qdp0q` as requested: `horse-api-qdp0q`.
- There is no `index.js` in this repository; uvicorn is configured to bind to `0.0.0.0` directly via the `CMD` instruction.
