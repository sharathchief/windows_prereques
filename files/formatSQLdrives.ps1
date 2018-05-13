function FoprmatSQLDisk([string]$driveletter, [string]$drivelabel)
{
	Format-volume -DriveLetter $driveletter -NewfileSystemLabel $drivelabel -FileSystem NTFS -Allocationunitsize 65536 -Force -Confirm:$false -verbose
}
Write-Host -Object "Formatting drive C...."
FromatSQLDisk -driveletter C -drivelabel "SYSTEM_C"

Write-Host -Object "Formatting drive D...."
FromatSQLDisk -driveletter D -drivelabel "DATA"

Write-Host -Object "Formatting drive E...."
FromatSQLDisk -driveletter E -drivelabel "SQLLOG"

Write-Host -Object "Formatting drive F...."
FromatSQLDisk -driveletter F -drivelabel "SQLDATA"

Write-Host -Object "Formatting drive G...."
FromatSQLDisk -driveletter G -drivelabel "SQLTEMPPDB"

Write-Host -Object "Formatting drive H...."
FromatSQLDisk -driveletter H -drivelabel "SQLBACKUP"


