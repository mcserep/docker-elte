$ErrorActionPreference = "Stop"
$count = (Get-ChildItem -Path .\ -Filter *.sln -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
  Get-ChildItem -Path .\ -Filter *.sln -Recurse -File -Name | ForEach-Object {
    Write-Output "Now building: $_"
    MSBuild "$_" /restore /t:Build

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
