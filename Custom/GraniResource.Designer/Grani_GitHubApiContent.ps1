Import-Module xDSCResourceDesigner
$property = @()
$property += New-xDscResourceProperty -Name DestinationPath -Type String -Attribute Required -Description "File Path to output Donwloaded item."
$property += New-xDscResourceProperty -Name Repository -Type String -Attribute Key -Description "GitHub Repository name to access."
$property += New-xDscResourceProperty -Name RepositoryOwner -Type String -Attribute Required -Description "GitHub Repository Owner Name which content owns."
$property += New-xDscResourceProperty -Name ContentPath -Type String -Attribute Required -Description "Path to the content. If README.md under root, then just README.md. Make sure path is case-sensitive."
$property += New-xDscResourceProperty -Name Branch -Type String -Attribute Write -Description "Specify Branch name for the content. Default is master."
$property += New-xDscResourceProperty -Name OAuth2Token -Type PSCredential -Attribute Write -Description "OAuth2 Token for Private Repository Authorization. Only password will be use."
$property += New-xDscResourceProperty -Name Header -Type Hashtable -Attribute Write -Description "Specify Headers for Web Request."
$property += New-xDscResourceProperty -Name ContentType -Type String -Attribute Write -ValidateSet "application/json", "application/vnd.github+json" -Description "Select Media Type to access GitHub API Default is application/json."
$property += New-xDscResourceProperty -Name UserAgent -Type String -Attribute Write -Description "Specify User-Agent for Web Request"
$property += New-xDscResourceProperty -Name AllowRedirect -Type Boolean -Attribute Write -Description "Specify if you want to control Redirect."
$property += New-xDscResourceProperty -Name CacheLocation -Type String -Attribute Write -Description "Specify CacheLocation to hold your last configuration result."
$property += New-xDscResourceProperty -Name Ensure -Type String -Attribute Read -ValidateSet Present, Absent -Description "Describe File is exist on DestinationPath or not."

New-xDscResource -Name Grani_GitHubApiContent -Property $property -Path .\ -ModuleName GraniResource -FriendlyName cGitHubApiContent -Force