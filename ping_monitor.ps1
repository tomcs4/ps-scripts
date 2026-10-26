#target IPs or URLs
$Targets = "google.com", "shodan.io", "randomsitethatdoesntexist.cam", "zombo.com", "another_website_that_doesnt_exist.com", "github.com"

if(Test-Connection (Get-NetRoute -DestinationPrefix "0.0.0.0/0").NextHop -Count 1 -Quiet){
	foreach ($Server in $Targets) {
		if(Test-Connection -ComputerName $Server -Count 1 -Quiet){
			Write-Host "[ONLINE] $Server is up" -ForegroundColor Green
		}
		else {
			Write-Host "[OFFLINE] $Server is down" -ForegroundColor Red
		}
	}
}
else {
	Write-Host "Network unreachable. Check to make sure you are online" -ForegroundColor Yellow
}