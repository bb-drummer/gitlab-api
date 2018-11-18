#! /usr/bin/env bash

gitlab_git_user_config () {

    # git config 
    git config user.email "${GITLAB_USER_EMAIL}";
    git config user.name "${GITLAB_USER_NAME}";

    echo -e "Setting repository's user to \e[96m'${GITLAB_USER_NAME} <${GITLAB_USER_EMAIL}>\e[0m'...\n";
    git config --list;

}