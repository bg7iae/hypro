# Dockerfile for hysteria deployment on Azure Container
# Base image: Debian 12 (Bookworm)
FROM debian:12-slim

# Set non-interactive mode for APT
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic utilities
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        iproute2 \
        iputils-ping \
        nano \
        vim \
        tzdata \
    # Clean up cached files to reduce image size
    && rm -rf /var/lib/apt/lists/*

# Expose ports for HTTPS and HTTP traffic
EXPOSE 443 80 50520

# Default command keeps the container running so you can exec into it and install hysteria manually
CMD ["tail", "-f", "/dev/null"]
