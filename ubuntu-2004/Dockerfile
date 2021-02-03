FROM ubuntu:20.04

# tzdata package is installed implicitly in the following command. This package
# sets timezone interactively during the installation process. This environment
# variable prevents this interaction.
ARG DEBIAN_FRONTEND=noninteractive

# Update package repository
RUN apt-get update
# Install compiler and build tools
RUN apt-get install -y build-essential cmake
