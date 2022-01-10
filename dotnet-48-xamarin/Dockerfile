# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# VS Build Tools
# See: https://docs.microsoft.com/en-us/visualstudio/install/build-tools-container
RUN `
    # Download the VS 2022 Build Tools bootstrapper.
    curl -SL --output vs_buildtools.exe https://aka.ms/vs/17/release/vs_buildtools.exe `
    `
    # Install the specified VS 2022 Build Tools.
    && (start /w vs_buildtools.exe --quiet --wait --norestart --nocache modify `
        --installPath "%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools" `
		--includeRecommended `
        --add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools `
		--add Microsoft.VisualStudio.Workload.UniversalBuildTools `
		--add Microsoft.VisualStudio.Workload.XamarinBuildTools `
		--add Component.Android.SDK.MAUI `
        || IF "%ERRORLEVEL%"=="3010" EXIT 0) `
    `
    # Cleanup
    && del /q vs_buildtools.exe

# Java SDK
# See: https://docs.microsoft.com/en-us/java/openjdk/install
RUN `
    # Download the Microsoft Build of OpenJDK.
    curl -SL --output openjdk11.msi https://aka.ms/download-jdk/microsoft-jdk-11.0.12.7.1-windows-x64.msi `
    `
    # Install OpenJDK 11.
    && start /w msiexec /i openjdk11.msi `
        ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome `
        INSTALLDIR="%ProgramFiles%\Microsoft\" `
        /quiet `
    `
    # Cleanup
    && del /q openjdk11.msi

# Install Android SDK API 30
RUN echo "y" | "%ProgramFiles(x86)%\Android\android-sdk\cmdline-tools\5.0\bin\sdkmanager.bat" "platforms;android-30"

# Define the entry point for the docker container.
# This entry point starts the developer command prompt and launches the PowerShell shell.
ENTRYPOINT ["C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\Tools\\VsDevCmd.bat", "&&", "powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

# Add VS project build script
COPY ./build.ps1 C:\
