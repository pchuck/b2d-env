# boot2docker test env 
#

# prerequisites
#
#   VirtualBox
#     https://www.virtualbox.org/
#   Docker for OSX Installer
#     https://github.com/boot2docker/osx-installer/releases

# set these environment variables based on output from 'start'
#DOCKER_IP=`boot2docker ip`
DOCKER_IP=192.168.59.103
DOCKER_HOST=tcp://$(DOCKER_IP):2376
DOCKER_CERT_PATH=/Users/${USER}/.boot2docker/certs/boot2docker-vm
DOCKER_TLS_VERIFY=1

# create boot2docker virtual machine
init:
	boot2docker init

# power on the boot2docker vm and docker daemon
start:
	boot2docker start

# power off the boot2docker vm and docker daemon
stop:
	boot2docker stop

# fetch the latest boot2docker vm image
download:
	boot2docker download

# upgrade boot2docker
upgrade: stop download start

# initialize local keys from host
shellinit:
	echo "NOTE: run the following command directly in the shell.."
	. scripts/docker_init_sh.sh

# fetch the ip of the docker vm
getip:
	boot2docker ip

# dump environment
showvars:
	@echo DOCKER_IP=$(DOCKER_IP)
	@echo DOCKER_HOST=$(DOCKER_HOST)
	@echo DOCKER_CERT_PATH=$(DOCKER_CERT_PATH)
	@echo DOCKER_TLS_VERIFY=$(DOCKER_TLS_VERIFY)

# show vm status
status:
	boot2docker status

# show vm details
info:
	boot2docker info

# show profile configuration
config:
	boot2docker config

# show available images
images:
	docker images



### canned containers

start_hello:
	docker run hello-world

start_nginx:
	docker run --rm -i -t -p 80:80 nginx

test_nginx:
	wget $(DOCKER_IP)


### fully custom project/container
### (using custom embedded project 'testnode', to illustrate build/start process)

build_testnode:
	docker build -t $(USER)/testnode testnode/

start_testnode:
	docker run --rm -i -t -p 8181:8181 $(USER)/testnode


# other commands
#   ssh - login to vm 
#   delete - delete the boot2docker vm image
#   version
