#!/usr/bin/env bash

file=./Dockerfile
if [ -z "${1}" ]; then
	if [ -f "${file}" ]; then
		image=$(sed -En -e '/^#\simage\s?=/s/^#\simage\s?=\s?//p' ${file})
    image=${image%$'\r'}
	else
		exit 1;
	fi
else
	if [ -f "${1}" ]; then
		file=${1}
		image=$(sed -En -e '/^#\simage\s?=/s/^#\simage\s?=\s?//p' ${file})
    image=${image%$'\r'}
	else
		image=${1}
	fi
fi

echo "BUIDLING ${image}"

docker image rm ${image} --force 2>&1 >/dev/null

set -e

DOCKER_BUILDKIT=1 docker build -f ${file} -t ${image} --allow=network.host --progress=plain . 2>&1 | tee build.log
#DOCKER_BUILDKIT=1 docker build -f ${file} -t ${image} --no-cache --progress=plain . 2>&1 | tee build.log

#docker builder prune -af
