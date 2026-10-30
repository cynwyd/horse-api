FROM public.ecr.aws/amazonlinux/amazonlinux:2023

LABEL service-name="horse-api-bzciu"

RUN dnf update -y && \
    dnf install -y python3 python3-pip python3-devel shadow-utils && \
    dnf clean all

RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

COPY --chown=appuser:appuser requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser . .

# Include a VERSION file with the current timestamp
RUN date -u +"%Y-%m-%dT%H:%M:%SZ" > /app/VERSION

RUN chown appuser:appuser /app/VERSION

USER appuser

EXPOSE 8000

CMD ["python3", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
