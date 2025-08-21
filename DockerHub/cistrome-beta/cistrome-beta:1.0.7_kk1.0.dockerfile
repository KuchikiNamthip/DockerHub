FROM ubuntu:20.04

LABEL maintainer="(Namthip) Krittiyabhorn Kongtanawanich <kkrittiyabhorn@gmail.com>"
LABEL description="Docker image for Cistrome BETA v1.0.7 with user mapping"

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python2 \
    python2-dev \
    curl \
    unzip \
    git \
    build-essential \
    r-base \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install setuptools, pip, argparse, numpy for Python 2
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 && \
    pip2 install setuptools argparse numpy

# Build args for host UID and GID
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create a user that matches host UID/GID
RUN groupadd -g ${GROUP_ID} betauser && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash betauser

# Set a writable Python egg cache for the user
ENV PYTHON_EGG_CACHE=/home/betauser/.python-eggs
RUN mkdir -p /home/betauser/.python-eggs && chmod -R 777 /home/betauser/.python-eggs

# Install BETA 1.0.7
# Download date: Aug 13, 2025 from http://cistrome.org/BETA/src/BETA_1.0.7.zip
WORKDIR /opt
RUN wget http://cistrome.org/BETA/src/BETA_1.0.7.zip && \
    unzip BETA_1.0.7.zip && \
    cd BETA_1.0.7 && \
    python2 setup.py install && \
    rm -rf /opt/BETA_1.0.7*

# Set environment variables
ENV PATH="/usr/local/bin:${PATH}"
ENV PYTHONPATH="/usr/local/lib/python2.7/dist-packages:${PYTHONPATH}"

# Switch to the created user by default
USER betauser
WORKDIR /home/betauser

CMD ["bash"]
