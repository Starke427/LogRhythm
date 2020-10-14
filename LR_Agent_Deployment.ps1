### Get User Credentials for Installation ###
$cred = Get-Credential USERNAME

### Create PSSessions ###
$s = New-PSSession -ComputerName HOSTNAME -Credential $cred

### Remotely Install LR Agent (Path can be a UNC Share) ###
Invoke-Command -Session $s -ScriptBlock {Start-Process “\PATH\TO\LRSystemMonitor_64_7.5.1.8000.exe” -ArgumentList ‘/s /v” /qn ADDLOCAL=ALL HOST=108.170.13.61’

### Remotely Start and Enable LR Agent on Boot ###
Invoke-Command -Session $s {Start-Service ‘scsm’}
Invoke-Command -Session $s {Set-Service -Name ‘scsm’ -StartupType Automatic}

### Clean Up PSSessions ###
Remove-PSSession $s
