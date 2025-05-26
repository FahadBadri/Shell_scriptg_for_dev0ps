#!/bin/bash


<<task
Deploy django app
and handle error in code
task

code_clone(){
	echo "Cloning the Django app.."
	if [ -d "django-notes-app" ];
	then
		echo "The code directory already exist. Skipping It..."
	else

	git clone https://github.com/LondheShubham153/django-notes-app.git
	fi
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restart(){
	echo "restatring dependencies"
	sudo chown $USER /var/run/docker/sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
}

Deploy(){
	echo "Building the docker"
	cd django-notes-app || { echo "Field to enter the project directory"; exit 1; }
	sudo docker build -t notes-app .
        sudo docker run -d -p 8000:8000 notes-app:latest
}

echo "*************** DEPLOYMENT IS STARTING WAIT AND SEE THE MAGIC  **************"

if ! code_clone;
then
	echo "the code directory already exist"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation Failed"
	exit 1
fi

if ! required_restart; then
	echo "System fault Identitfied"
	exit 1
fi

Deploy


echo "************************** DEPLOYMENT IS DONE VOILLA  ***********************"

