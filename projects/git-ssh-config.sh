#! /usr/bin/env bash

gitlab_git_ssh_config () {

    # get git ssh URI
    if [ -z $GIT_SSH_URI ]; then
        export GIT_SSH_URI="${CI_PROJECT_URL/^http[s]?\:\/\/i/'git@'}.git";
    fi

    if [ -z $GIT_SSH_ORIGIN_NAME ]; then
        export GIT_SSH_ORIGIN_NAME="pipeline-origin";
    fi

    origin_name_param="$1";
    if ! [ $origin_name_param == "" ]; then
       origin_name=$origin_name_param
    fi

    # git config set origin git@gitlab....
    git remote add ${GIT_SSH_ORIGIN_NAME} ${GIT_SSH_URI};

    echo -e "Setting repository's remote origin \e[96m'${GIT_SSH_ORIGIN_NAME}'\e[0m to \e[96m'${GIT_SSH_URI}'\e[0m...\n";

}