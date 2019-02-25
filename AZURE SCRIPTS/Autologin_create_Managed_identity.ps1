
<#
#========================================================================
# Created with: SAPIEN Technologies, Inc., PowerShell Studio 2012 v3.1.35
# Created on:   10/11/2017 10:50
# Created by:   danny
# Organization: dtek
# Filename:     
#========================================================================
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
#>

#Install-Module PowerShellGet –Repository PSGallery –Force
#Install-Module Az –Repository PSGallery –AllowClobber
### AUTOLOGIN #####

$basePath = "E:\AZURE_SCRIPTS\CREDENTIALS\TEST\ALL\"
$isAuthed = Test-Path $basePath"_profile.json"
if(!$isAuthed) {
    Login-AzureRmAccount 
    $subscrib = Get-AzureRmSubscription
    if($subscrib -is [System.Object[]]){
        for($k=0; $k -lt $subscrib.Count; $k++) {
            Write-Host $k - $subscrib[$k].Name
        }
        $subNo = $subscrib.Count;
        while($subNo -ge $subscrib.Count) {
            $subNo = Read-Host -Prompt 'Enter Subscription number'
        } 
        Select-AzureRmSubscription -SubscriptionId $subscrib[$subNo].SubscriptionId
    }else{
        Select-AzureRmSubscription -SubscriptionId $subscrib.SubscriptionId
    }
    mkdir $basePath
    Save-AzureRmContext -Path $basePath"_profile.json" -Force
}else {
    Import-AzureRmContext -Path $basePath"_profile.json"
}

#### SET  PARAMETERS ######



#### VIEW SELECTED SUBSCRIPTION ######
Write-Host " Selected subscription is:"

$sub=(Get-AzureRmContext).Subscription
$sub.Name
$SubName=$sub.Name

#### PARAMS #####

#### ARE YOU SURE ######
$message  = 'AZURE CHANGE CONFIRMATION'
$question = "You are about to do something with the following settings in Subscription: $SubName  `r`n `r`n Are you sure you want to proceed?`r`n"

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  Write-Host 'confirmed'
  Write-Host 'Doing Something'


try {
    
    Add-AzureRmAccount
    Set-AzureRmContext -SubscriptionId f569951b-8693-445e-bf54-68774832f86f
    $app = New-AzureRmADApplication -DisplayName "PowerShellLogin" -HomePage "{URL}/PowerShellLogin" -IdentifierUris "{URL}/PowerShellLogin" -Password "EYczJs4p8HgCKHp4"
    $app
    New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId
    New-AzureRmRoleAssignment -RoleDefinitionName Reader -ServicePrincipalName $app.ApplicationId

   
    $cred = New-Object System.Management.Automation.PSCredential ("02e79480-acfb-4284-ac9e-7caaa8b244e84", $servicePrincipal.Secret)
    Connect-AzAccount -Credential $cred -ServicePrincipal -TenantId 92832cfc-349a-4b12-af77-765b6f10b51f




   <#
   #### Create self signed certificate and 
    $cert = New-SelfSignedCertificate -CertStoreLocation "cert:\CurrentUser\My" `
    -Subject "CN=PowerShellLoginScriptCert" `
    -KeySpec KeyExchange
  $keyValue = [System.Convert]::ToBase64String($cert.GetRawCertData())
  
  $sp = New-AzADServicePrincipal -DisplayName PowerShellLoginReadOnly `
    -CertValue $keyValue `
    -EndDate $cert.NotAfter `
    -StartDate $cert.NotBefore
  Sleep 20
  New-AzRoleAssignment -RoleDefinitionName Reader -ServicePrincipalName $sp.ApplicationId
  
  
  $TenantId = (Get-AzSubscription -SubscriptionName "Contoso Default").TenantId
  $TenantId ="92832cfc-349a-4b12-af77-765b6f10b51f"
  $ApplicationId = (Get-AzADApplication -DisplayNameStartWith PowerShellLoginReadOnly).ApplicationId
  
   $Thumbprint = (Get-ChildItem cert:\CurrentUser\My\ | Where-Object {$_.Subject -eq "CN=exampleappScriptCert" }).Thumbprint
   Connect-AzAccount -ServicePrincipal `
    -CertificateThumbprint $Thumbprint `
    -ApplicationId $ApplicationId `
    -TenantId $TenantId
#>
<#
### Connect #####
$cred = New-Object System.Management.Automation.PSCredential ("00c01aaa-1603-49fc-b6df-b78c4e5138b4", $servicePrincipal.Secret)
Connect-AzAccount -Credential $cred -ServicePrincipal -TenantId 92832cfc-349a-4b12-af77-765b6f10b51f

New-AzRoleAssignment -ResourceGroupName myRG -ObjectId 698138e7-d7b6-4738-a866-b4e3081a69e4 -RoleDefinitionName Reader

Get-AzRoleAssignment -ResourceGroupName myRG -ObjectId 698138e7-d7b6-4738-a866-b4e3081a69e4

Remove-AzRoleAssignment -ResourceGroupName myRG -ObjectId 698138e7-d7b6-4738-a866-b4e3081a69e4 -RoleDefinitionName Contributor

https://blogs.msdn.microsoft.com/benjaminperkins/2017/01/20/execute-an-azure-powershell-arm-script-without-prompting-for-credentials/
https://docs.microsoft.com/en-us/powershell/azure/create-azure-service-principal-azureps?view=azps-1.3.0
#>

#https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal
#### ACTIVE CODE ########


    
    #Something -ErrorAction Stop
} catch {
    #Something
}

Write-Host 'Something'	

Write-Host 'Completed Script'
#### ACTIVE CODE ########
}else {
  Write-Host 'Cancelled Change to Azure'
}



