FROM ubuntu:20.04

LABEL maintainer="(Namthip) Krittiyabhorn Kongtanawanich <kkrittiyabhorn@gmail.com>"
LABEL description="Docker image for Cistrome BETA2 using Python 3.8 with user mapping"

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies (NOW INCLUDING R)
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3.8-dev \
    python3-pip \
    curl \
    unzip \
    git \
    build-essential \
    wget \
    bash \
    r-base \
    && rm -rf /var/lib/apt/lists/*

# Make python3.8 the default
RUN ln -sf /usr/bin/python3.8 /usr/bin/python3 && \
    ln -sf /usr/bin/python3.8 /usr/bin/python

# Upgrade pip and install BETA2 from PyPI
RUN python3 -m pip install --upgrade pip setuptools && \
    pip install --no-cache-dir beta-binding-analysis

# Build args for host UID and GID
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create a user that matches host UID/GID
RUN groupadd -g ${GROUP_ID} betauser && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash betauser

# Switch to the created user
USER betauser
WORKDIR /home/betauser

CMD ["bash"]
