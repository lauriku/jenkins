# Jenkins docker image for development purposes
The Dockerfile in this repo is used to build a jenkins-image to use for testing and development. It comes with a a set of plugins to use Pipelines and docker build environments (CloudBees plugin).

# start.sh
The script runs the image with arguments, that map the host docker.sock inside the container. This might not be a good idea to do in production. The container is run with the same UID and GID as the user running the container, so it will have the same permissions to use the host docker.

# Run it
Just run `./start.sh` and it should start the jenkins container. When it's started up, it should be available at <http://localhost:8080>
