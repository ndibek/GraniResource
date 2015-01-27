Import-Module xDSCResourceDesigner
$property = @()
$property += New-xDscResourceProperty `
    -Name S3BucketName `
    -Type String `
    -Attribute Key `
    -Description "S3 Bucket name to access."
$property += New-xDscResourceProperty `
    -Name Key `
    -Type String `
    -Attribute Write `
    -Description "S3 Object Key which identify content. You can't use both Key and KeyPrefix at once."
$property += New-xDscResourceProperty `
    -Name DestinationPath `
    -Type String `
    -Attribute Required `
    -Description "Path to output Donwloaded item."
$property += New-xDscResourceProperty `
    -Name Ensure `
    -Type String `
    -Attribute Read `
    -ValidateSet Present, Absent `
    -Description "Describe File is exist on DestinationPath or not."

New-xDscResource -Name Grani_S3Content -Property $property -Path .\ -ModuleName GraniResource -FriendlyName cS3Content -Force