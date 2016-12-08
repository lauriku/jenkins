#!/usr/bin/env bash

[[ -ne "${PWD}/data_dir" ]] && mkdir -p ${PWD}/data_dir

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
-v ${PWD}/data_dir:/var/jenkins_home -u ${user_id}:${group_id} -p 8080:8080 lauriku/jenkins
