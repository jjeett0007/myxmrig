# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Set the working directory
WORKDIR /xmrig

# Copy the xmrig executable, config.json, and SHA256SUMS into the container
COPY xmrig /xmrig/
COPY config.json /xmrig/
COPY SHA256SUMS /xmrig/

# Make sure the xmrig executable has the right permissions
RUN chmod +x /xmrig/xmrig

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Run the xmrig command
CMD ["./xmrig", "-a", "gr", "-o", "stratum+ssl://ghostrider.unmineable.com:443", "-u", "DOGE:DDZ1fcQCSkNENvVpxFnyjaD326WEDWvMH2.unmineable_worker_kyvwk", "-p", "x"]
