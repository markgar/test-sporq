# Declare your common properties
$commonProperties = Get-SpqCommonProperties
$commonProperties.EnvironmentName = "dev"
$commonProperties.ApplicationCode = "q4k"

# Grab an empty base template
$baseTemplate = Get-SpqBaseTemplate

# Create Storage Account
$myStorageAccount = Get-SpqStorageAccount -CommonProperties $commonProperties -Location "centralus" -StorageAccessTier "Standard_LRS" -StorageTier "Standard"
Write-Host $myStorageAccount
# Add to Template
$baseTemplate.resources += $myStorageAccount

# convert the template object to a json string
$baseTemplate | ConvertTo-Json -Depth 10 

# create the ./out directory
New-Item -ItemType Directory -Force -Path './out'

# output the template to the ./out directory
$baseTemplate | Out-File './out/azuredeploy.json'