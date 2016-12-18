FROM jenkins:2.19.4

USER root
RUN curl -sSL https://get.docker.com/ | sh

USER jenkins
RUN install-plugins.sh docker-workflow \
workflow-cps \
workflow-step-api \
workflow-durable-task-step \
workflow-basic-steps \
greenballs \
pipeline-input-step \
pipeline-stage-view \
ansicolor \
git \
maven

ENV JAVA_OPTS "-Dhudson.Main.development=true -Djenkins.install.runSetupWizard=false"
