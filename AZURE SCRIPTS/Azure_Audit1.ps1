function Get-DaAzureRMResources
{
[CmdletBinding()]
param()
<#
.Synopsis
gets azure ARM resources and outputs to an object.
.DESCRIPTION
Connect to Azure and retrieve quota information from associated subscriptions.
.EXAMPLE
Get-PAzureRMResources
.EXAMPLE
Get-PAzureRMResources
.NOTES
#>
BEGIN
{
#$azureObject = @()
write-verbose 'Verifying user is logged into Azure.'
If ((Get-AzureRMContext) -eq $null)
{
write-verbose 'User is not logged into Azure. Begin login process.'
Add-AzureRmAccount
} #If

Else
{
write-verbose (‘User is logged into Azure as ‘ + (Get-AzureRmContext).Account + ‘. Continuing…’)
} #Else
} #BEGIN
PROCESS
{
$subs = Get-AzureRmSubscription
ForEach ($SubName in $subs)
{
#Import-Module AzureRM.profile
write-verbose (“Subscription $($SubName.SubscriptionName) specified. Retrieving information on the specified subscription.”)
Try
{
$azureRMSubcription = Set-AzureRmContext -SubscriptionName ($SubName.SubscriptionName)
$Subscription = Get-AzureRmResource
ForEach ($Sub in $Subscription)
{
[PSCustomObject]@{
‘SubscriptionName’ = $SubName.SubscriptionName
‘Name’ = $Sub.Name
‘ResourceName’ = $Sub.ResourceName
‘ResourceType’ = $Sub.ResourceType
#’Tags’ = $Sub.Tags
‘Location’ = $Sub.Location
‘ResourceId’ = $Sub.ResourceId
‘SubscriptionId’ = $Sub.SubscriptionId
} #PSCustomObject
} #ForEach
} #Try
Catch [System.Exception]
{
write-verbose (‘Error Output was’ + ($Error[0] | Select-Object *))
} #Catch
} #ForEach
#$azureObject
} #PROCESS
END
{
write-verbose ‘Processing of Azure ARM Audit complete.’
} #END
} #Function