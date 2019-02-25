<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	25/02/2019 20:38
	 Created by:   	danny
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
$basePath = "E:\GIT-LOCAL-REPOSITORIES\DTEK_AZURE_VM_CREATOR\DTEK_AZURE_VM_CREATOR\CREDENTIALS\"
$isAuthed = Test-Path $basePath"_profile.json"
if (!$isAuthed)
{
	Login-AzureRmAccount
	
	#mkdir $basePath
	Save-AzureRmContext -Path $basePath"_profile.json" -Force
}
else
{
	Import-AzureRmContext -Path $basePath"_profile.json"
}

 Get-AzureRmSubscription