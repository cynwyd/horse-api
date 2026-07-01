FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# Install Python and pip
RUN dnf update -y && \
    dnf install -y python3 python3-pip python3-devel shadow-utils && \
    dnf clean all

# Create non-root user
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY --chown=appuser:appuser requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy application source
COPY --chown=appuser:appuser main.py .

# Generate VERSION file with current timestamp
RUN date -u +"%Y-%m-%dT%H:%M:%SZ" > /app/VERSION && \
    chown appuser:appuser /app/VERSION

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 8000

# Run the application
CMD ["python3", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
