#!/bin/bash
#######################################
#          Splunk + Tailscale         #
# Clone Splunk Enterprise instance    #
# through docker. Expose the instance #
# to tailnet.                         #
#######################################

SPLUNK_PASSWORD=""
TAILSCALE_AUTHKEY=""
CONTAINER_NAME='splunk'

# Check if Docker package exists.
if ! command -v docker &> /dev/null
then
	echo "Docker not found. Installing..."
	
	# Install Docker Dependencies
	curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/docker-archive-keyring.gpg >/dev/null
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list

	# Install Docker 
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
else
	echo "Docker found."
fi

# Pull Splunk docker container.
sudo docker pull splunk/splunk:latest

# Check if container already exists.
CID=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)
if [ ! "${CID}" ]; then
	echo "Container name unoccupied. Creating..."
	sudo docker run -d -p 8000:8000 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=${SPLUNK_PASSWORD}" --name ${CONTAINER_NAME} splunk/splunk:latest
else
	echo "Container naming conflict. Either remove existing or change script container name."
	exit 1
fi
unset CID

# Check if Tailscale exists.
if ! command -v tailscale &> /dev/null
then
	echo "Tailscale not found. Installing..."
	curl -fsSL https://tailscale.com/install.sh | sh
else
	echo "Tailscale found."
fi

# Run Tailscale
sudo tailscale up --authkey $TAILSCALE_AUTHKEY
