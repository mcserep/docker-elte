$ErrorActionPreference = "Stop"
$params = $args -split " "
$stdin = while (1) {
  Read-Host | set r;
  if (!$r) {break};
  $r;
}

$count = (Get-ChildItem -Path .\ -Filter *.csproj -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
  Get-ChildItem -Path .\ -Filter *.csproj -Recurse -File -Name | ForEach-Object {
    $isDotnetFramework = (Select-String -Path "$_" -Pattern "<Project.*ToolsVersion=").Matches.Success
    
    if ($isDotnetFramework) {
      Write-Output ".NET Framework project found. Use .NET (Core) instead."
      throw ".NET Framework project found. Use .NET (Core) instead."
    }
    
    $isExecutable = (Select-String -Path "$_" -Pattern "<OutputType>Exe</OutputType>").Matches.Success
    
    if ($isExecutable) {
      echo $stdin | dotnet run -c Release --no-build --project "$_" $params
      break
    }
  }
}
else {
  Write-Output "No Visual Studio projects found."
  throw "No Visual Studio projects found."
}
