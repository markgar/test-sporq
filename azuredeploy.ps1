# Declare your common properties
$commonProperties = Get-SpqCommonProperties
$commonProperties.EnvironmentName = "dev"
$commonProperties.ApplicationCode = "q4k"

# Grab an empty base template
$baseTemplate = Get-SpqBaseTemplate

# Create Storage Account
$myStorageAccount = Get-SpqStorageAccount -CommonProperties $commonProperties -Location "centralus" -StorageAccessTier "Standard_LRS" -StorageTier "Standard"

# Add to Template
$baseTemplate.resources += $myStorageAccount

# create the ./out directory - no need to output results to console (Out-Null)
New-Item -ItemType Directory -Force -Path './out' | Out-Null

# convert the template object to a json string and output to disk
$baseTemplateAsJson = $baseTemplate | ConvertTo-Json -Depth 10

# output to ./out directory so I can ignore it in .gitignore
$baseTemplateAsJson | Out-File './out/azuredeploy.json'