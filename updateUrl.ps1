git pull -force
$ngrokOutput = ConvertFrom-Json (Invoke-WebRequest -Uri http://localhost:4040/api/tunnels).Content
$httpsUrl = $ngrokOutput.tunnels.public_url[0]

$startOfIndex = "<meta http-equiv=`"Refresh`" content=`"0; url='"
$endOfIndex = "'`" />"
$index = $startOfIndex + $httpsUrl + $endOfIndex
$index | Out-File -FilePath .\index.html
git add .\index.html
git commit -m "Automated push to update the URL redirect in the index."
git push