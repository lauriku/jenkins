FROM jenkins/jenkins:lts

USER root

ENV AWS_DEFAULT_REGION eu-west-1

RUN apt-get update -y \
      && apt-get install -y zip python python-pip git wget curl jq \
      && pip install awscli

ENV PACKER_VERSION 1.1.1
RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip && \
    rm packer_${PACKER_VERSION}_linux_amd64.zip

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
