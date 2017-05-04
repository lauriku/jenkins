FROM jenkins:2.46.2

USER root

ENV AWS_DEFAULT_REGION eu-west-1

RUN apt-get update -y \
      && apt-get install -y zip python python-pip git wget curl\
      && pip install awscli

RUN cd /tmp \
      && wget "https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip" \
      && unzip packer_1.0.0_linux_amd64.zip \
      && cp packer /usr/bin \
      && chmod +x /usr/bin/packer

RUN curl -sSL https://get.docker.com/ | sh

USER jenkins
RUN install-plugins.sh docker-workflow \
workflow-cps \
workflow-step-api \
workflow-durable-task-step \
workflow-basic-steps \
pipeline-input-step \
pipeline-stage-view \
ansicolor \
git \
maven

ENV JAVA_OPTS "-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false"
