# docker-elte

Contains images for education purposes at ELTE FI (Eötvös Loránd University, Faculty of Informatics).

## Available images

### `mcserep/elte:ubuntu-2004`
An Ubuntu 20.04 OS with essential build tools added.

### `mcserep/elte:ubuntu-2004-qt5`
An Ubuntu 20.04 OS with Qt5 SDK and essential build tools added.

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

### `mcserep/elte:dotnet-48-xamarin`
Same as `mcserep/elte:dotnet-48`, with the following  additional tools:
 - Universal Windows Platform workload for VS Build Tools
 - Mobile Development with .NET workload for VS Build Tools
 - Android SDK (API 30 & API 31)
 - Java SDK (OpenJDK 11)

Contains a `C:\build.ps1` build script to compile Visual Studio solutions. Uses *MSBuild* to compile UWP and Xamarin projects.

### `mcserep/elte:dotnet-60`
Windows Server, version 2019 OS with the .NET SDK 6.0 included.

Contains a build script to compile Visual Studio solutions (only .NET Core supported). Usage:
 - copy the Visual Studio solutions into the container in a preferred folder;
 - execute the `C:\build.ps1` script in that folder.
