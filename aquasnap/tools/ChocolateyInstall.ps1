$ErrorActionPreference = 'Stop';

$version = '1.23.15'
$packageName = 'AquaSnap'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = "https://www.nurgo-software.com/download/${packageName}_${version}/AquaSnap.msi"
$url64      = "https://www.nurgo-software.com/download/${packageName}_${version}/AquaSnap.msi"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'AquaSnap*'

  checksum      = '545DACEF1BF5F01429C5525A22AEC712D8313A41DDA5FEE289EE78CF0B72FEFF'
  checksumType  = 'sha256'
  checksum64    = '545DACEF1BF5F01429C5525A22AEC712D8313A41DDA5FEE289EE78CF0B72FEFF'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
