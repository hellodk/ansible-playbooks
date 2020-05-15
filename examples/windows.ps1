New-Item -Path C:\Temp -ItemType Directory

$config_script = "C:\Temp\ConfigureRemotingForAnsible.ps1"


(New-Object -TypeName System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1", $config_script)


powershell.exe -ExecutionPolicy ByPass -File $config_script -EnableCredSSP


verify WinRM is up and running over a HTTPS listener:
-----------------------------------------------------
$username = "vagrant"

$password = ConvertTo-SecureString -String "vagrant" -AsPlainText -Force

$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password

$session_option = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck

Invoke-Command -ComputerName 127.0.0.1 -UseSSL -ScriptBlock { whoami } -Credential $cred -SessionOption $session_option