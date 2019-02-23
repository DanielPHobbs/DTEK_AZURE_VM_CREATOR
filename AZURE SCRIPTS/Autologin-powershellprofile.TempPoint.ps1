<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	23/02/2019 11:00
	 Created by:   	danny
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

Write-Host ""
Write-Host "1. Environment Contoso" -ForegroundColor Green
Write-Host "2. Environment Contoso Development" -ForegroundColor Green
Write-Host ""

Do { Write-Host -NoNewline "Where to login? Type a number from 1 – 2: " -ForegroundColor Magenta; [int]$choice = read-host }
while ((1 .. 2) -notcontains $choice)

Switch ($choice)
{
	1 {
		Select-AzureRmProfile -Path "c:\AzureProfile\azureprofile1.json" | Out-Null;
		Write-Host "Successfully logged in using saved profile file" -ForegroundColor Green;
		Get-AzureRmSubscription –SubscriptionName "your subscription name" | Select-AzureRmSubscription;
		Write-Host "Set Azure Subscription for session complete" -ForegroundColor Green
	}
	2 {
		Select-AzureRmProfile -Path "c:\AzureProfile\azureprofile2.json" | Out-Null;
		Write-Host "Successfully logged in using saved profile file" -ForegroundColor Green;
		Get-AzureRmSubscription –SubscriptionName "your second subscription name" | Select-AzureRmSubscription;
		Write-Host "Set Azure Subscription for session complete" -ForegroundColor Green
	}
}
