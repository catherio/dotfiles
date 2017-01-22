docify() {
	env="$1"
	export DOCKER_CERT_PATH=~/.openai/personal/sci/
	export DOCKER_TLS_VERIFY=1

	if [ "$env" == "" ] || [ "$env" == dev0 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://0.devbox.sci.openai.org:2376
	elif [ "$env" == dev1 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://1.devbox.sci.openai.org:2376
	elif [ "$env" == public0 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://0.public-devbox.sci.openai.org:2376
	elif [ "$env" == public1 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://1.public-devbox.sci.openai.org:2376
	elif [ "$env" == public2 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://2.public-devbox.sci.openai.org:2376
	elif [ "$env" == public3 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://3.public-devbox.sci.openai.org:2376
	elif [ "$env" == public4 ]; then
		export DOCKER_API_VERSION=1.23
		export DOCKER_HOST=tcp://4.public-devbox.sci.openai.org:2376
	elif [ "$env" == machine ]; then
		eval $(docker-machine env default)
		docker-machine start default
	elif [ "$env" == local ]; then
		unset DOCKER_API_VERSION
		unset DOCKER_HOST DOCKER_IP DOCKER_CERT_PATH DOCKER_TLS_VERIFY DOCKER_MACHINE_NAME
	else
		echo "No such env: $env"
	fi
	}
