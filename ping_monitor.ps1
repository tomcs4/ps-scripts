#target IPs or URLs
$Targets = "google.com", "shodan.io", "randomsitethatdoesntexist.cam"

foreach ($Server in $Targets) {
	if(Test-Connection -ComputerName $Server -Count 1 -Quiet){
		Write-Host "[ONLINE] $Server is up" -ForegroundColor Green
	}
	else {
		Write-Host "[OFFLINE] $Server is down" -ForegroundColor Red
	}
}
