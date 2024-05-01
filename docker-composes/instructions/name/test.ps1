docker-compose up -d
$content = (docker logs foo-container)

docker-compose rm -f

clear-host

if($content -eq "I'm running foo-application"){
    write-host "--------------------------------------------"
    write-host "SUCCESS TEST"
    write-host "Log message: $content"
}else{
    write-host "ERROR TEST"
}