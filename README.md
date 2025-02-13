# docker-elte

Contains images for education purposes at ELTE FI (Eötvös Loránd University, Faculty of Informatics).

## Available images

### `mcserep/elte:ubuntu-2004`
An Ubuntu 20.04 OS with essential build tools (C/C++) and [Ericsson CodeChecker](https://codechecker.readthedocs.io/) added.

### `mcserep/elte:ubuntu-2004-qt5`
Extends the `mcserep/elte:ubuntu-2004` image with the Qt5 SDK.

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

### `mcserep/elte:dotnet-60-linux`
Debian 11 Bullseye based image with the .NET 6 SDK (.NET CLI, .NET runtime, ASP.NET Core).

Contains a build script to compile Visual Studio solutions (only .NET Core supported). Usage:
- copy the Visual Studio solutions into the container in a preferred folder;
- execute the `/build.sh` script in that folder to build all solutions found;
- execute the `/execute.sh` script in that folder to run the first found executable project.

 Contains `Roslynator.Dotnet.CLI` and the following Roslyn-based analyzers:
 - `Microsoft.CodeAnalysis.NetAnalyzers`
 - `SonarAnalyzer.CSharp`
 - `Roslynator.Analyzers`

### `mcserep/elte:dotnet-60-windows`
Windows Server, version 2019 OS with the .NET SDK 6.0 included.

Contains a build script to compile Visual Studio solutions (only .NET Core supported). Usage:
 - copy the Visual Studio solutions into the container in a preferred folder;
 - execute the `C:\build.ps1` script in that folder to build all solutions found;
 - execute the `C:\execute.ps1` script in that folder to run the first found executable project.

 Contains `Roslynator.Dotnet.CLI` and the following Roslyn-based analyzers:
 - `Microsoft.CodeAnalysis.NetAnalyzers`
 - `SonarAnalyzer.CSharp`
 - `Roslynator.Analyzers`

### `mcserep/elte:dotnet-60`
Multi-architecture image for `mcserep/elte:dotnet-60-linux` and `mcserep/elte:dotnet-60-windows`.

### `mcserep/elte:dotnet-60-maui`
Extends the `mcserep/elte:dotnet-60-windows` image with MAUI support and related tooling:
 - MAUI workload for .NET (for Windows, Android, iOS, macOS, tvOS)
 - Android SDK (API 31 & API 33)
 - Java SDK (OpenJDK 8 & OpenJDK 11)

Contains a `C:\build.ps1` build script to compile Visual Studio solutions.

### `mcserep/elte:workbook`
An Ubuntu 24.10 based image capable of building HTML and PDF workbooks from Markdown.  
Toolset:
 - [Pandoc](https://pandoc.org/)
   - [Diagram Generator](https://github.com/pandoc-ext/diagram)
 - [wkhtmltopdf](https://wkhtmltopdf.org/)
 - [PlantUML](https://plantuml.com/)
 - [Graphviz](https://graphviz.org/)
 - [GNU Make](https://www.gnu.org/software/make/)