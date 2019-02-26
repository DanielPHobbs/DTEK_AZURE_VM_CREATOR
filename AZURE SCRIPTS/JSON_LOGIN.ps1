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
$basePath = "E:\GIT-LOCAL-REPOSITORIES\DTEK_AZURE_VM_CREATOR\DTEK_AZURE_VM_CREATOR\CREDENTIALS"
$isAuthed = Test-Path $basePath"\_profile.json"
$TenantId = "92832cfc-349a-4b12-af77-765b6f10b51f"
if (!$isAuthed)
{
	Login-AzureRmAccount -TenantId $TenantId
	
	$Subscriptions = Get-AzureRmSubscription
	foreach ($Subscription in $Subscriptions)
	{
		
		[String]$SubscriptionName = $Subscription.name
		$SubscriptionName
		set-azureRMcontext -Name $SubscriptionName
		Save-AzureRMContext -Path "$basePath\$SubscriptionName.json" -Force
	}
}
else
{
	Import-AzureRmContext -Path $basePath"_profile.json"
}