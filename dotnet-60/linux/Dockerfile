FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim

ENV ANALYZERS_PATH=/analyzers
ENV PATH="$PATH:/root/.dotnet/tools"

# Install Roslynator CLI
RUN dotnet tool install --global roslynator.dotnet.cli --version 0.5.0

# Install Nuget CLI to download analyzers
RUN apt-get update \ 
	&& apt-get install -y nuget \
	&& rm -rf /var/lib/apt/lists/*

# Install analyzers
RUN mkdir $ANALYZERS_PATH
RUN nuget install Microsoft.CodeAnalysis.NetAnalyzers -Version 6.0.0 -OutputDirectory $ANALYZERS_PATH
RUN nuget install SonarAnalyzer.CSharp -Version 8.51.0.59060 -OutputDirectory $ANALYZERS_PATH
RUN nuget install Roslynator.Analyzers -Version 4.2.0 -OutputDirectory $ANALYZERS_PATH

# Add .NET project build script
COPY ./build.sh ./execute.sh /
RUN chmod 755 /build.sh /execute.sh
