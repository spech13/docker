docker build -qt healthcheck .
docker run -d --name healthcheck-container healthcheck

$container_state = (docker inspect --format="{{json .State}}" healthcheck-container) | convertfrom-json
$container_healthcheck_status = $container_state.health.status

while($container_healthcheck_status -eq "starting"){
    write-host "Container healthcheck status: $container_healthcheck_status"
    sleep 5
    $container_state = (docker inspect --format="{{json .State}}" healthcheck-container) | convertfrom-json
    $container_healthcheck_status = $container_state.health.status
}

docker stop healthcheck-container
docker rm healthcheck-container
docker rmi healthcheck

clear

$container_status = $container_state.status
$container_exit_code = $container_state.health.log[$container_state.health.log.length-1].exitcode
$container_error_message = $container_state.health.log[$container_state.health.log.length-1].output


if($container_healthcheck_status -eq "unhealthy"){
    write-host "----------------------------------------------------------------------"
    write-host "SUCCESS TEST:`n"
    write-host "Container status: $container_status"
    write-host "Container healthcheck status: $container_healthcheck_status"
    write-host "Container exit code: $container_exit_code"
    write-host "Container healthcheck error: $container_error_message"
}else{
    write-host "----------------------------------------------------------------------"
    write-host "FAILED TEST: container healthcheck is not unchealthy`n"
    write-host "Container status: $container_status"
    write-host "Container healthcheck status: $container_healthcheck_status"
    write-host "Container exit code: $container_exit_code"
    write-host "Container healthcheck error: $container_error_message"
}


