#!/usr/bin/env bash
# since: 2022-09-30
# author: gengxiankun <gengxiankun@126.com>
set -e

source ${DIR}/functions/handle_vars.sh
source ${DIR}/scripts/docker/default.sh

# 变量预设
generateDockerImageName
generateDockerContainerName

function buildDockerImage() {
    echo $docker_image_name
    # 构建镜像
    docker build -t ${docker_image_name} -f ${dockerfile_path} .
}

case $_function in
    docker-image )
        set -x; buildDockerImage; set +x
        ;;
    * )
        echo -e "$ERROR Unrecognized command of build: ${_function:-unkown}"; exit 1
        ;;
esac
