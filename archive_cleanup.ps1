# Delete all Files in D:\LogRhythmArchives\Inactive older than 365 day(s)
$Path = "D:\LogRhythmArchives\Inactive\*\
$Daysback = "-365"
$CurrentDate = Get-Date
$DatetoDelete = $CurrentDate.AddDays($Daysback)
Get-ChildItem D:\LogRhythmArchives\Inactive\ -recurse -directory | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Recurse
