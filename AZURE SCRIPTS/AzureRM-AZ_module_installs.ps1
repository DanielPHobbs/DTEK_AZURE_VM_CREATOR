<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	28/02/2019 13:24
	 Created by:   	danie
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

Install-Module -Name Az -AllowClobber -Force

Get-InstalledModule -Name Az -AllVersions | select Name, Version

Get-InstalledModule -Name AzureRM -AllVersions

Uninstall-Module -name AzureRM -RequiredVersion 6.13.1 -Force

Install-Module -Name AzureRM -AllowClobber -force

Update-AzureRM
Import-Module azurerm
Enable-AzureRmAlias -Scope CurrentUser
Disable-azurermalias


Uninstall-AllModules -TargetModule Az -Version 0.7.0 -Force

# Device Code login - Provides a link to sign into Azure via your web browser
Connect-AzAccount

# Service Principal login - Use a previously created service principal to log in
Connect-AzAccount -ServicePrincipal -ApplicationId 'http://my-app' -Credential $PSCredential -TenantId $TenantId