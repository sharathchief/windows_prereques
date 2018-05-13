Params(
 $Drive=="D"
 )
 
function Remove-Pagefile($Path) {
	Get-WmiObject Win32_PageFileSetting | Where-object { $_.Name -eq $Path } | Remove-WinObject
}

function Get-pagefile {
	Param(
		$Path
	)
	return Get-WmiObject Win32_PageFileSetting | Where-Object { $_.Name -eq $Path }
}

function Set-PageFile {
	Param(
		$InitialSize,
		$MaximumSize,
		$Path
	)
	try{
		$ExistingPageFile = Get-Pagefile -Path $PageFilePath
		if($ExistingPageFile -eq $null)
		{
			$PageFile = Set-WmiInstance -Class Win32_PageFileSetting -Arguments @{Name = $Path; InitialSize = 0; MaximumSize = 0}
			$PageFile.InitialSize = $InitialSize
			$PageFile.MaximumSize = $MaximumSize
			$PageFie.Put()
		}
		else {
			$ExistingPageFile.InitialSize = $InitialSize
			$ExistingPageFile.MaximumSize = $MaximumSize
			$ExixtingPageFile.Put()
		}
	}
	catch {
		throw $Error[0]
	}
}

#GetFull Path of pagefile
$PageFilePath = $Drive + ":\pagefile.sys"
$PhysicalMemory = Get-WmiObject -class "win32_physicalmemory" -namespace "root\CIMV2"
$TotalRAM = $((($PhysicalMemory).Capacity | Measure-Object -Sum).Sum/1GB)
$PageFileMaxSizeHashTable = @{
	4="8"
	8="8"
	12="8"
	16="8"
	24="8"
	32="8"
	48="10"
	64="12"
	72="13"
	96="17"
	112="20"
	128="23"
	256="43"
	512="85"
}
$InitialSize=1024
$MaximumSize=$PageFileMaxSizeHashTable.Item($TotalRAM)
Set-PageFile -InitialSize $InitialSize -MaximumSize $MaximumSize -Path $PageFilePath