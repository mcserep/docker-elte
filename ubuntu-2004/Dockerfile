FROM ubuntu:20.04

# tzdata package is installed implicitly in the following command. This package
# sets timezone interactively during the installation process. This environment
# variable prevents this interaction.
ARG DEBIAN_FRONTEND=noninteractive

# Update package repository and install packages
RUN apt-get update && apt-get install -y \
    # Install compiler, build and analyzer tools
    build-essential \
    clang \
    clang-tidy \
    cmake \
    cppcheck \
    gcc-multilib \
    # Install Python 3
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    # Install miscellaneous tools
    rename \
    # Clear apt lists cache
    && rm -rf /var/lib/apt/lists/*

# Install CodeChecker
RUN pip install codechecker==6.21.0
