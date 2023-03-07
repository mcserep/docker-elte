# docker-elte

Contains images for education purposes at ELTE FI (Eötvös Loránd University, Faculty of Informatics).

## Available images

### `mcserep/elte:ubuntu-2004`
An Ubuntu 20.04 OS with essential build tools and Ericsson CodeChecker added.

### `mcserep/elte:ubuntu-2004-qt5`
An Ubuntu 20.04 OS with Qt5 SDK, essential build tools and Ericsson CodeChecker added.

Contains a build script to compile Qt projects. Usage:
 - copy the Qt projects into the container in a preferred folder;
 - execute the `/build.sh` script in that folder.

### `mcserep/elte:dotnet-48`
Windows Server, version 2019 OS with the following tools included:
 - .NET Framework 4.8 SDK
 - .NET 6.0 SDK
 - Visual Studio Build Tools
 - Visual Studio Test Agent
 - NuGet CLI

Contains a build script to compile Visual Studio solutions (.NET Framework and .NET Core). Usage:
 - copy the Visual Studio solutions into the container in a preferred folder;
 - execute the `C:\build.ps1` script in that folder.

### `mcserep/elte:dotnet-60`
Windows Server, version 2019 OS with the .NET SDK 6.0 included.

Contains a build script to compile Visual Studio solutions (only .NET Core supported). Usage:
 - copy the Visual Studio solutions into the container in a preferred folder;
 - execute the `C:\build.ps1` script in that folder.

 Contains Roslynator.Dotnet.CLI and the following Roslyn-based analyzers:
 - Microsoft.CodeAnalysis.NetAnalyzers
 - SonarAnalyzer.CSharp
 - Roslynator.Analyzers

### `mcserep/elte:dotnet-60-maui`
Extends the `mcserep/elte:dotnet-60` image with MAUI support and related tooling:
 - MAUI workload for .NET (for Windows, Android, iOS, macOS, tvOS)
 - Android SDK (API 31 & API 33)
 - Java SDK (OpenJDK 8 & OpenJDK 11)

Contains a `C:\build.ps1` build script to compile Visual Studio solutions.
