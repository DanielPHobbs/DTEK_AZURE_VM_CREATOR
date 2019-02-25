<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	25/02/2019 08:10
	 Created by:   	danny
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
Install-Module Az –Repository PSGallery –AllowClobber

$cred = New-Object System.Management.Automation.PSCredential ("02e79480-acfb-4284-ac9e-7caaa8b244e84", "z5KMwA3DmvoeeSCvzoocvq5pHi78gsFR+0iKoSDvHZk=")
Connect-AzAccount -Credential $cred -ServicePrincipal -TenantId 92832cfc-349a-4b12-af77-765b6f10b51f