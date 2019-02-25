<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	25/02/2019 19:27
	 Created by:   	danny
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


$applicationId = "02e79480-acfb-4284-ac9e-7caaa8b244e8";
$securePassword = "z5KMwA3DmvoeeSCvzoocvq5pHi78gsFR+0iKoSDvHZk=" | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $applicationId, $securePassword
Connect-AzureRmAccount -ServicePrincipal -Credential $credential -TenantId "92832cfc-349a-4b12-af77-765b6f10b51f"

# Fetching subscription list
$Global:subscription_list = get-azurermsubscription
$Global:subscription_list

$jobScript= { get-azurermvm }

Start-Job -ScriptBlock $jobScript -Name GetVMAzure1

Wait-Job -Name GetVMAzure1
[array]$azJobResults = (Get-Job -Name 'GetVMAzure1' | Receive-Job);
$azJobResults