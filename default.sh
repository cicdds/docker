#!/usr/bin/env bash
# since: 2022-09-30
# author: gengxiankun <gengxiankun@126.com>
set -e

source ${DIR}/functions/handle_vars.sh

# 生成 Docker 镜像名称变量
# 规则：{私有仓库地址}/{Git仓库地址}:{环境变量}-latest
# 注意：目前统一构建 latest 版本
function generateDockerImageName() {
    if [[ ! -n ${docker_registry_url} || ! -n ${ci_project_path} || ! -n ${env} ]]; then
        echo -e "$ERROR docker_registry_url, ci_project_path or env does not exist, unable to generate docker image name";exit 1
    fi
    docker_image_name=${docker_registry_url}/${ci_project_path}:${env}-latest
}

# 生成 Docker 容器名称变量
function generateDockerContainerName() {
    if [[ ! -n ${ci_project_path} ]]; then
        echo -e "$ERROR ci_project_path does not exist, unable to generate docker container name";exit 1
    fi
    # 将 "/" 替换成 "_"
    docker_container_name=${ci_project_path//\//_}
}
