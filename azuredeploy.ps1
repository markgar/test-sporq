# Grab an empty base template
$baseTemplate = Get-SpqBaseTemplate

# Create Storage Account
$myStorageAccount = Get-SpqStorageAccount -ApplicationCode "kd8" -EnvironmentName "dev" -Location "centralus" -StorageAccessTier "Standard_LRS"

# Add to Template
$baseTemplate.resources += $myStorageAccount

# Take the baseTemplate object, convert to Json, then output to disk
$baseTemplate | ConvertTo-Json -Depth 10 | Out-File './azuredeploy.json'

Get-SpqPesterTests -OutputPath "./"