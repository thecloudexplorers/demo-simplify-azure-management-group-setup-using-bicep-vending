
<#
    NOTE: Assumes you are already connected using Connect-AzAccount
    and that you have the context you are logged in with has
    permissions to create management groups.
#>
$managementGroupParams = @{
    Location              = "West Europe"
    TemplateFile          = ".\src\iac\az-patterns\managementGroupHierarchy.bicep"
    TemplateParameterFile = ".\src\examples\example_ManagementGroupParameter.json"
    Verbose               = $true
}
New-AzTenantDeployment @managementGroupParams