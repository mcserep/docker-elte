$ErrorActionPreference = "Stop"
$count = (Get-ChildItem -Path .\ -Filter *.sln -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
  Get-ChildItem -Path .\ -Filter *.csproj -Recurse -File -Name | ForEach-Object {
    Write-Output "Now checking: $_"
    $isDotnetFramework = (Select-String -Path "$_" -Pattern "<Project.*ToolsVersion=").Matches.Success
    
    if ($isDotnetFramework) {
      Write-Output ".NET Framework project found. Use .NET (Core) instead."
      throw ".NET Framework project found. Use .NET (Core) instead."
    }
  }

  Get-ChildItem -Path .\ -Filter *.sln -Recurse -File -Name | ForEach-Object {
    Write-Output "Now building: $_"
    dotnet build -c Release "$_"

    if ($LastExitCode -ne 0) {
      Write-Output "Compilation error."
      throw "Compilation error."
    }
  }
}
else {
  Write-Output "No Visual Studio solutions found."
  throw "No Visual Studio solutions found."
}
