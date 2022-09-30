#!/usr/bin/env bash
# since: 2022-09-30
# author: gengxiankun <gengxiankun@126.com>
set -e

source ${DIR}/functions/handle_vars.sh
source ${DIR}/scripts/docker/default.sh

# 变量预设
generateDockerImageName
generateDockerContainerName

function pushDockerImage() {
    dockerAuth
    docker push ${docker_image_name}
}

case $_function in
    docker-image )
        set -x; pushDockerImage; set +x
        ;;
    * )
        echo -e "$ERROR Unrecognized command of push: ${_function:-unkown}"; exit 1
        ;;
esac
