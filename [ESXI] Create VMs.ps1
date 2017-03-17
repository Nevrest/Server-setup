Import-Module vmware.vimautomation.core

$Default = [PSCustomObject]@{
    "Ram" = 2
    "cpu" = 2
}

$Collection = @(
    @{
        VMName = "Vm01" 
    },
    @{
        VMName = "VM02"
    }
    @{
        VMName = "VM03"
    }
    @{
        VMName = "VM04"
    }
    @{
        VMName = "VM05"
    }
    @{
        VMName = "VM06"
    }
    @{
        VMName = "VM07"
    }
    @{
        VMName = "VM08"
    }
)
if(-not ($cred))
{ 
    $cred = Get-Credential
}

Connect-VIServer -Server 172.16.0.162 -Credential $cred | Out-Null

$Collection | foreach {
    $Name = $_
    $vm = get-vm $Name.VMName -ErrorAction SilentlyContinue
    
    #Made by Tommy Bråthen

    #Stop if it's running
    if($vm)
    {
        $vm | Stop-VM -Confirm:$false
    }
}

$Collection | foreach {
    $Name = $_
    $vm = get-vm $Name.VMName -ErrorAction SilentlyContinue
    
    #Remove if already existing
    if($vm)
    {
        $vm | Remove-VM -DeletePermanently -Confirm:$false -ErrorAction SilentlyContinue
    }
}
#Make new VM

$Collection | foreach {
    $Name = $_
    $vm = get-vm $Name.VMName -ErrorAction SilentlyContinue
    $ds = Get-Datastore -Name "VM STORAGE"

    $fail = $True
    $Retries = 0
    $RetryLimit = 5
    while($fail -eq $True -and $Retries -le $RetryLimit)
    {
        try
        {
            Write-Host "Now creating: " $Name.VMName
            New-VM -Name $Name.VMName -Datastore $ds -MemoryGB $Default.Ram -ErrorAction Stop
            Start-Sleep -Seconds 2
            $fail = $False
        }
        catch
        {
            Start-Sleep -Seconds 2
            $fail = $True
            Write-Host "VM creation failed, trying again."
            $Retries++
        }
    }
}
