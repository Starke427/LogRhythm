$taskAction = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Restart-Service -Name scsm'
$taskAction
$taskTrigger = New-ScheduledTaskTrigger -Daily -At 1AM
$tasktrigger
$taskName = "RestartLRagent"
$description = "Restart LogRhythm Agent daily at 1am."
Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -Description $description -RunLevel Highest
