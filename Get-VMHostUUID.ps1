param([string]$vc = "vc", [string]$container = "container", [string[]]$vmhosts = $null)

# add the snapin, just in case
Add-PSSnapin VMware.VimAutomation.Core

#Show Usage
function usage()
	{
	Write-host -foregroundcolor green `n`t"This script is used to pull UUIDs for all hosts provided."
	Write-host -foregroundcolor green `n`t"You can either specify -vmhosts as an array:"
	write-host -foregroundcolor yellow `n`t`t"Get-VMHostUUID.ps1 -vmhosts (`"host1`",`"host2`",`"host3`")"
	write-host -foregroundcolor green `n`t"or specify -vc and -container, where container is a host name, cluster, folder, datacenter, etc:"
	write-host -foregroundcolor yellow `n`t`t"Get-VMHostUUID.ps1 -vc vcenterserver -container cluster1" `n
    write-host -foregroundcolor green `t"if -container is not used, it pulls ALL hosts from the given vCenter" `n
   	write-host -foregroundcolor green `t"You can use either -vmhosts by itself, or -vc, not a combination of them, and -container is optional." `n
	}

function Get_UUID()
{
    foreach ($vmhost in $vmhosts)
	{
	   if ($esx -eq 1)
	   #do this only if connecting directly to ESX hosts
		{
		connect-viserver $vmhost -credential $vmhost_creds > $NULL 2>&1
		}
	$vmhostUUID = (Get-VMHost $vmhost | Get-View).hardware.systeminfo.uuid
    Write-Host `n
	Write-Host -foregroundcolor green "Server: " $vmhost
	write-host -foregroundcolor green "UUID: " $vmhostUUID
	    if ($esx -eq 1)
	    #disconnect from the current ESX host before going to the next one
        {
        disconnect-viserver -confirm:$false
        }
	}
    	if ($vcenter -eq 1)
        #disconnect from vcenter
        {
        disconnect-viserver -confirm:$false
        }
}

#check to make sure we have all the args we need
if (($vmhosts -eq $null) -and ($vc -eq "vc"))
    #if vmhosts and vc is not supplied
	{
	usage
    break
	}

elseif (($vmhosts -ne $null) -and ($vc -ne "vc"))
    #if both vmhosts and vc was supplied
	{
	usage
    break
	}

elseif (($vmhosts -ne $null) -and ($container -ne "container"))
    #if both vmhosts and container was supplied
	{
	usage
    break
	}

elseif (($vmhosts -ne $null) -and (($vc -eq "vc") -or ($container -eq "container")))
    #if only vmhosts is used, set our esx variable to 1 and get credentials
	{
    $esx = 1
    $vmhost_creds = $host.ui.PromptForCredential("ESX/ESXi Credentials Required", "Please enter credentials to log into the ESX/ESXi host.", "", "")
    Get_UUID
    }

elseif (($vmhosts -eq $null) -and (($vc -ne "vc") -and ($container -eq "container")))
    #if vc and container are used, set our vcenter variable to 1, get credentials, and populate vmhosts
	{
    $vcenter = 1
    $vc_creds = $host.ui.PromptForCredential("vCenter Credentials Required", "Please enter credentials to log into vCenter.", "", "")
    connect-viserver $vc -credential $vc_creds > $NULL 2>&1
    $vmhosts = get-vmhost | sort name
    Get_UUID
	}

elseif (($vmhosts -eq $null) -and (($vc -ne "vc") -and ($container -ne "container")))
    #if vc and container are used, set our vcenter variable to 1, get credentials, and populate vmhosts
	{
    $vcenter = 1
    $vc_creds = $host.ui.PromptForCredential("vCenter Credentials Required", "Please enter credentials to log into vCenter.", "", "")
    connect-viserver $vc -credential $vc_creds > $NULL 2>&1
    $vmhosts = get-vmhost -location $container | sort name
    Get_UUID
	}

#garbage collection
$vmhost_creds = $null
$vc_creds = $null
$vmhosts = $null
$vc = $null
$container = $null
$esx = $null
$vcenter = $nullno
