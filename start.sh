#!/usr/bin/env bash

[[ ! -d "${PWD}/data_dir" ]] && mkdir -p ${PWD}/data_dir

docker pull lauriku/jenkins

docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
-v ${PWD}/data_dir:/var/jenkins_home -w /var/jenkins_home \
--env HOME=/var/jenkins_home --env JENKINS_HOME=/var/jenkins_home \
--env HOST_JENKINS_HOME=${PWD}/data_dir \
-u ${user_id}:${group_id} -p 8080:8080 lauriku/jenkins
