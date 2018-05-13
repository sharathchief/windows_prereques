$Shell = New-Object -ComObject Shell.Application
$Global:Recycler = $Shell.NameSpace(0xa)

Foreach($item in $Recycler.Items())
{
	$DeleteDate = $Recycler.GetDetailsof($item,2) -replace "\u200f|\u200e"'""
	$dtDeleteDate = get-date $DeleteDateIf($dtDeleteDate -lt (Get-Date).AddDays(-3))
	{	
		Remove-Item -Path $item.Path -Confirm:$false -Force -Recurse
	}
}