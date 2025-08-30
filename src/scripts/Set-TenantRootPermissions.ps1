
<#
    This snippet sets the specified user as a root "/" Owner role assignment in the Azure tenant.
#>
$userPrincipalName = "username@yourtenant.com"
$userPrincipal = Get-AzADUser -UserPrincipalName $userPrincipalName

$userPrincipalHasRootRoleAssignment = Get-AzRoleAssignment | Where-Object { $_.ObjectId -eq $userPrincipal.Id -and $_.Scope -eq "/"}

if ($null -eq $userPrincipalHasRootRoleAssignment) {
    Write-Host "User does not have root role assignment, assigning..."
    New-AzRoleAssignment -Scope '/' -RoleDefinitionName 'Owner' -ObjectId $userPrincipal.Id
}

Write-Host "All done!!!"