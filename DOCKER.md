# Docker Build & Run Instructions — horse-api

## Overview

`horse-api` is a FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is embedded at `/app/VERSION` inside the image at build time.

---

## Prerequisites

- Docker installed and running
- Access to the internet (to pull the base image and install dependencies)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
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

To inspect the build timestamp embedded in the image:

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn logs are written to stdout, compatible with ECS/CloudWatch log collection.
- No database or external service dependencies are required.
