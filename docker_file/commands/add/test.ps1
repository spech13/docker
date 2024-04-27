docker build -qt add-image .
docker run -d --name add-container add-image

$actual_result = (docker exec -t add-container ls -la test)

docker stop add-container 
docker rm add-container
docker rmi add-image

clear

function get_actual_str([string]$actual_str) {
    $conllected_str = ""
    foreach($item in $actual_str.split(" ")){
        if ($item -ne ""){
            $conllected_str = $conllected_str + $item + "$"
        } 
    }
    $arr = $conllected_str.split("$")
    $actual_str = $arr[0] + " " + $arr[2] + " " + $arr[8]
    $actual_str
}

$actual_str1 = get_actual_str $actual_result[3]
$actual_str2 = get_actual_str $actual_result[4]
$actual_str3 = get_actual_str $actual_result[5]

$condition = (
    $actual_str1 -eq "-rwxr-xr-x root temp.txt" -and
    $actual_str2 -eq "-rwxr-xr-x myuser temp2.txt" -and
    $actual_str3 -eq "-r-------- myuser2 temp3.txt"
)

if($condition){
    write-host "--------------------------------------------------"
    write-host "SUCCESS TEST"
    write-host "$actual_str1`n$actual_str2`n$actual_str3"
}else{
    write-host "ERROR TEST"
}
