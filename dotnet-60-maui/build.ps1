$ErrorActionPreference = "Stop"
$count = (Get-ChildItem -Path .\ -Filter *.sln -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
  Get-ChildItem -Path .\ -Filter *.csproj -Recurse -File -Name | ForEach-Object {
    Write-Output "Now checking: $_"
    $isDotnetFramework = (Select-String -Path "$_" -Pattern "<Project.*ToolsVersion=").Matches.Success

    if ($isDotnetFramework) {
      Write-Error -Message ".NET Framework project found. Use .NET (Core) instead." -Category InvalidType
    }
  }

  Get-ChildItem -Path .\ -Filter *.sln -Recurse -File -Name | ForEach-Object {
    Write-Output "Now building: $_"
    dotnet build "$_"

    if ($LastExitCode -ne 0) {
      Write-Error -Message "Compilation error." -Category InvalidOperation
    }
  }
}
else {
  Write-Error -Message "No Visual Studio solutions found." -Category InvalidData
}
