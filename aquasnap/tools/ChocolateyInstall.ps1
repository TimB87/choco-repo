$ErrorActionPreference = 'Stop';

$version = '1.23.11'
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

  checksum      = '35DA4ADC2F6B1A279157B4FCF6296704E234F2FC4CCB4573591C16BAA1799A03'
  checksumType  = 'sha256'
  checksum64    = '35DA4ADC2F6B1A279157B4FCF6296704E234F2FC4CCB4573591C16BAA1799A03'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
