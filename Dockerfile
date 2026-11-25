FROM public.ecr.aws/amazonlinux/amazonlinux:2023

LABEL service-name="horse-api-4tx88"

RUN dnf update -y && \
    dnf install -y python3 python3-pip shadow-utils && \
    dnf clean all

RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

COPY --chown=appuser:appuser requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser . .

COPY --chown=appuser:appuser VERSION .

USER appuser

EXPOSE 8000

CMD ["python3", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
