docker_ip()
{
	if [ ! -z "$1" ]; then
		docker inspect "$1" -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'
	fi
}

docker_cleanup()
{
	docker rm -v "$(docker ps --filter status=exited -q 2>/dev/null)" 2>/dev/null
	docker rmi "$(docker images --filter dangling=true -q 2>/dev/null)" 2>/dev/null
}
