# Dockerfile for a minimal Python environment with restricted user access
# version: 1.0
# authors: Andres Parra <github.com/byandrev>
# description: This Dockerfile creates a minimal Python environment
#              with a non-root user and restricted access to only the Python binary.

FROM debian:stable-slim

RUN apt-get update && \
  apt-get install -y python3 && \
  rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd --create-home restricteduser

# Set up a secure binary directory
RUN mkdir -p /usr/local/securebin && \
  cp /usr/bin/python3 /usr/local/securebin/python && \
  chmod 755 /usr/local/securebin/python

# Change ownership of the directory to the user
RUN chown -R restricteduser:restricteduser /usr/local/securebin

ENV PATH="/usr/local/securebin"

USER restricteduser
WORKDIR /home/restricteduser

CMD ["python"]
