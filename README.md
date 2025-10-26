# Python Sandbox

This Dockerfile creates a minimal Python environment with a non-root user and restricted access to only the Python binary.

## Build the Docker Image

```bash
docker build -t py-sandbox .
```

## Run the Docker Container

```bash
docker run -it --rm py-sandbox
```

## Run Docker Compose

```bash
docker-compose up
```

## Execute Python in the Container

```bash
docker exec -it <container_id> python
```

The container will start a Python interpreter session as the restricted user.

## Features

- Based on Debian stable-slim for a lightweight image.
- Installs Python 3.
- Creates a non-root user (`restricteduser`) for enhanced security.
- Restricts access to only the Python binary located in `/usr/local/securebin`.
- Sets appropriate permissions to ensure the user cannot access other system binaries.

## Usage

Once inside the container, you can run Python commands as the `restricteduser`. The user will only have access to the Python binary, ensuring a controlled environment.
