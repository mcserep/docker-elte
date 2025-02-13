FROM ubuntu:24.10

# Update package repository and install packages
RUN apt-get update && apt-get install -y \
	make \
	default-jre \
	graphviz \
	# wkhtmltopdf dependencies
	xfonts-75dpi xfonts-base \
    # Clear apt lists cache
    && rm -rf /var/lib/apt/lists/*

# Install Pandoc
ADD https://github.com/jgm/pandoc/releases/download/3.6.1/pandoc-3.6.1-1-amd64.deb /
RUN dpkg -i /pandoc-3.6.1-1-amd64.deb

# Install wkhtmltopdf
# (only available for Ubuntu 22.04)
ADD https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb /
# (try to install missing dependencies on fail)
RUN dpkg -i /wkhtmltox_0.12.6.1-2.jammy_amd64.deb || apt-get -y --fix-broken install 

# Download PlantUML
ADD https://github.com/plantuml/plantuml/releases/download/v1.2025.0/plantuml-1.2025.0.jar /opt/plantuml.jar

# Add custom scripts
COPY ./plantuml.sh ./diagram.lua /opt/
RUN chmod 755 /opt/plantuml.sh
ENV PLANTUML_BIN=/opt/plantuml.sh
