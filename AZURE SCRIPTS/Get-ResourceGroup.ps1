function Connect-Azure
{
  <#
      .SYNOPSIS
      Connect-Azure Function to login to Azure - using Resource Groups.
      .DESCRIPTION
      Prompts for Azure user credentials, prompts to select Azure Subscription and passes through to select an Azure subscrption.
      .EXAMPLE
      Connect-Azure
        .VERSION: 0.1
  #>
  Import-Module -Name AzureRM
 
  #Authenticate to Azure with Azure RM credentials
 
  Add-AzureRmAccount
 
  #Select Azure Subscription
  Get-AZureRMSubscription|Out-GridView -PassThru|Select-AzureRmSubscription
}
Connect-Azure

$currentsub = (Get-AzureRmContext).Subscription | Select-Object -ExpandProperty Name 


$rgs = (Get-AzureRmResourceGroup)

$results = @()

foreach ($rg in $rgs)
{ 
   $rg.ResourceGroupName
  
   $tags = foreach ($tag in $rg.tags)
           
     {
            
      $results += [pscustomobject]@{
        'Resource Group Name'          = $rg.ResourceGroupName 
        'Tag Keys' = $tag.keys  -join ',' 
        'Tag Values' = $tag.Values  -join ',' 
           
    
     }
     }
    
        
          }


$results


$results | 
 ConvertTo-Html -As Table -Title "Microsoft Azure Resource Groups" -Head "<H1>$currentsub - Azure Resource Groups</H1>"  -Body $Css | Out-File C:\temp\AzureRMResource.html
