$count = (Get-ChildItem -Path .\ -Filter *.sln -Recurse | Group-Object -Property Directory).Count
if ($count -gt 0) {
  Get-ChildItem -Path .\ -Filter *.sln -Recurse -File -Name | ForEach-Object {
    Write-Output "Now building: $_"
    dotnet build "$_"
  }
}
else {
  Write-Error -Message "No Visual Studio solutions found." -Category InvalidData
  exit 1
}
