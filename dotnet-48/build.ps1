$ErrorActionPreference = "Stop"
$count = (Get-ChildItem -Path .\ -Filter *.sln -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
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
