# escape=`
# Start with a custom Windows-based .NET 6 development image.
FROM mcserep/elte:dotnet-60-windows

# Use PowerShell during Docker image build.
SHELL ["powershell.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Chocolatey
ENV chocolateyVersion=1.4.0
RUN `
    # Download
    Invoke-WebRequest -OutFile C:\chocolatey-install.ps1 -URI https://community.chocolatey.org/install.ps1; `
    # Install
    Invoke-Expression C:\chocolatey-install.ps1; `
    # Cleanup
    Remove-Item C:\chocolatey-install.ps1

# Java and Android
RUN `
    # Install OpenJDK11
    choco install microsoft-openjdk11 --yes --no-progress; `
    # Install Android SDK
    choco install android-sdk --yes --no-progress; `
    # Install Chocolatey cleaner
    choco install choco-cleaner --yes --no-progress; `
    # Cleanup
    choco-cleaner

# Set JAVA_HOME (JDK 8, installed by Android SDK).
ENV JAVA_HOME="C:\Program Files\Java\jdk1.8.0_211"

# Symlink Android folder for .NET to find it at the expected location.
RUN New-Item -ItemType SymbolicLink -Path 'C:\Program Files (x86)\Android' -Target C:\Android\

# Install MAUI related workloads.
RUN dotnet nuget locals all --clear; `
    dotnet workload install maui --source https://aka.ms/dotnet6/nuget/index.json --source https://api.nuget.org/v3/index.json; `
    dotnet workload install android ios maccatalyst tvos macos --source https://aka.ms/dotnet6/nuget/index.json --source https://api.nuget.org/v3/index.json

# Install Android SDK tools and platforms.
RUN echo 'y' | & 'C:\Program Files (x86)\Android\android-sdk\tools\bin\sdkmanager.bat' `
    'platform-tools' 'build-tools;33.0.1' 'platforms;android-31' 'platforms;android-33'

# Define the entry point for the docker container.
ENTRYPOINT ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
