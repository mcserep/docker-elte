FROM mcserep/elte:ubuntu-2004

# Update package repository and install packages
RUN apt-get update && apt-get install -y \
    # Install Qt5
    qt5-default \
    # Clear apt lists cache
    && rm -rf /var/lib/apt/lists/*

# Add Qt project build script
COPY ./build.sh /
RUN chmod 755 /build.sh
