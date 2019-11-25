# Grab an empty base template
$baseTemplate = Get-SpqBaseTemplate

# Create Storage Account
$myStorageAccount = Get-SpqStorageAccount -ApplicationCode "kd8" -EnvironmentName "dev" -Location "centralus" -StorageAccessTier "Standard_LRS" -StorageTier "Standard"

# Add to Template
$baseTemplate.resources += $myStorageAccount

# output to ./out directory so I can ignore it in .gitignore
$baseTemplateAsJson | Out-File './azuredeploy.json'
