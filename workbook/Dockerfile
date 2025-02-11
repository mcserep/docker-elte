FROM ubuntu:24.04

# Update package repository and install packages
RUN apt-get update && apt-get install -y \
	make \
	wkhtmltopdf \
	default-jre \
	graphviz \
    # Clear apt lists cache
    && rm -rf /var/lib/apt/lists/*

# Install Pandoc
ADD https://github.com/jgm/pandoc/releases/download/3.6.1/pandoc-3.6.1-1-amd64.deb /
RUN dpkg -i /pandoc-3.6.1-1-amd64.deb

# Download PlantUML
ADD https://github.com/plantuml/plantuml/releases/download/v1.2025.0/plantuml-1.2025.0.jar /opt/plantuml.jar

# Add custom scripts
COPY ./plantuml.sh ./diagram.lua /opt/
RUN chmod 755 /opt/plantuml.sh
ENV PLANTUML_BIN=/opt/plantuml.sh
