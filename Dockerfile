FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# Install Python 3, pip, and shadow-utils for user management
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

# Generate VERSION file with build timestamp
RUN echo "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > /app/VERSION && \
    chown appuser:appuser /app/VERSION

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 8000

# Start the FastAPI application with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
