FROM mcr.microsoft.com/dotnet/sdk:6.0-windowsservercore-ltsc2019

# Environment variables
ENV ANALYZERS_DIR=C:\analyzers

# Use PowerShell during Docker image build
SHELL ["powershell.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Roslynator CLI
RUN dotnet tool install --global roslynator.dotnet.cli --version 0.5.0

# Download Nuget CLI
RUN Invoke-WebRequest -OutFile C:\nuget.exe -URI https://dist.nuget.org/win-x86-commandline/v6.4.0/nuget.exe

# Install analyzers
RUN C:\nuget.exe install Microsoft.CodeAnalysis.NetAnalyzers -Version 6.0.0 -OutputDirectory $env:ANALYZERS_DIR
RUN C:\nuget.exe install SonarAnalyzer.CSharp -Version 8.51.0.59060 -OutputDirectory $env:ANALYZERS_DIR
RUN C:\nuget.exe install Roslynator.Analyzers -Version 4.2.0 -OutputDirectory $env:ANALYZERS_DIR

# Add .NET project build script
COPY ./build.ps1 ./execute.ps1 C:/
