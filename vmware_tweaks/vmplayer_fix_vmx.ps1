$vmplayerPath='C:\Program Files (x86)\VMware\VMware Player\vmplayer.exe'
$GentooVmConfPath = 'C:\VMs\Gentoo\Gentoo.vmx'
(Get-Content $GentooVmConfPath).replace('svga.guestBackedPrimaryAware = "TRUE"', 'svga.guestBackedPrimaryAware = "FALSE"') | Set-Content $GentooVmConfPath
& $vmplayerPath