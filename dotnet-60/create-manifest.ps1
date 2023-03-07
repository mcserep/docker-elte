docker manifest create mcserep/elte:dotnet-60 `
  --amend mcserep/elte:dotnet-60-linux `
  --amend mcserep/elte:dotnet-60-windows
docker manifest push --purge mcserep/elte:dotnet-60
