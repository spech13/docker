docker build -t test-image .

$content = (docker image inspect --format="{{json .Config.Labels}}" test-image) | convertfrom-json

docker rmi test-image

clear

if(
    $content.org_name    -eq "MY_ORG" -and
    $content.address -eq "Russia, Moscow, Lenina 13"
){
    write-host "---------------------------------------------"
    write-host "SUCCESS TEST"
    write-host "Address: $($content.address)"
    write-host "Organization name: $($content.org_name)"
}else{
    write-host "ERROR TEST"
}