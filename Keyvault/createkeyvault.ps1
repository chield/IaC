$resourceGroupName = 'g-weu-keyvaults'
$projectName = 'azure4all-keyvaults'
$location = 'westeurope'
$upn = 'michiel.dekker@azure4all.com'
$secretValue = Read-Host -Prompt "Enter the virtual machine administrator password" -AsSecureString

$keyVaultName = $projectName
$adUserId = (Get-AzADUser -UserPrincipalName $upn).Id
$templateUri = "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/tutorials-use-key-vault/CreateKeyVault.json"

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri $templateUri -keyVaultName $keyVaultName -adUserId $adUserId -secretValue $secretValue

Write-Host "Press [ENTER] to continue ..."