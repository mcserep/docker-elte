$ErrorActionPreference = "Stop"
$count = (Get-ChildItem -Path .\ -Filter *.csproj -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
  Get-ChildItem -Path .\ -Filter *.csproj -Recurse -File -Name | ForEach-Object {
    $isDotnetFramework = (Select-String -Path "$_" -Pattern "<Project.*ToolsVersion=").Matches.Success
    
    if ($isDotnetFramework) {
      Write-Error -Message ".NET Framework project found. Use .NET (Core) instead." -Category InvalidType
    }
    
    $isExecutable = (Select-String -Path "$_" -Pattern "<OutputType>Exe</OutputType>").Matches.Success
    
    if ($isExecutable) {
      dotnet run -c Release --project "$_"
      
      if ($LastExitCode -ne 0) {
        Write-Error -Message "Execution error." -Category InvalidOperation
      }
      
      break
    }
  }
}
else {
  Write-Error -Message "No Visual Studio projects found." -Category InvalidData
}
