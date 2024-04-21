docker build -f Dockerfile-onbuild . -qt onbuild-image

$onbuil_dir_content = (docker run --rm onbuild-image ls /onbuild-dir)
$first_onbuild_content = (docker run --rm onbuild-image cat /onbuild-dir/first-onbuild)

docker build -f Dockerfile . -qt child-onbuild-image

$main_onbuil_dir_content = (docker run --rm child-onbuild-image ls /onbuild-dir)
$second_onbuild_content = (docker run --rm child-onbuild-image cat /onbuild-dir/second-onbuild)
$main_file_content = (docker run --rm child-onbuild-image cat /onbuild-dir/main-file)

docker rmi child-onbuild-image
docker rmi onbuild-image

clear

write-host "------------------------------------------------------------------------------"
write-host "ONBUILD IMAGE`n"
write-host "onbuild-dir content: $onbuil_dir_content"
write-host "first-onbuild content: $first_onbuild_content`n"
write-host "------------------------------------------------------------------------------"
write-host "CHILD ONBUILD IMAGE`n"
write-host "onbuild-dir content: $main_onbuil_dir_content"
write-host "first-onbuild content: $first_onbuild_content"
write-host "second-onbuild content: $second_onbuild_content"
write-host "main-file content: $main_file_content"