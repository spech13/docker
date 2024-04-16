docker build -t test-image .

write-host "-----------------------------------------------------------------"
write-host "Labels:"
docker image inspect --format="{{.Config.Labels.address}}" test-image
docker image inspect --format="{{.Config.Labels.org_name}}" test-image
write-host "-----------------------------------------------------------------"

docker rmi test-image