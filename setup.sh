#! /usr/bin/env bash

if [ `which awk` == "" ]; then echo -e "\e[91mCommand not found: awk\e[0m"; exit 1; fi
if [ `which curl` == "" ]; then echo -e "\e[91mCommand not found: curl\e[0m"; exit 1; fi
if [ `which jq` == "" ]; then echo -e "\e[91mCommand not found: jq\e[0m"; exit 1; fi

# set gitlab toolbox URL
if [ -z $DEVOPS_GITLAP_API_URL ]; then
    export DEVOPS_TOOLBOX_URL="https://gitlab.bjoernbartels.earth/devops/gitlab/api/raw/dev";
fi

# import 'gitlab_api', check and/or set mandatory global variables
if [ -z $CI_PROJECT_API_URL ] || [ -t gitlab_api ]; then 
    source <(curl -s "${DEVOPS_TOOLBOX_URL}/api-url.sh");
fi

#
# projects stuff
#

# import 'gitlab_git_ssh_config'
if ! [ -t gitlab_git_ssh_config ]; then 
    #source <(curl -s "${DEVOPS_TOOLBOX_URL}/projects/git-ssh-config.sh");
fi

# import 'gitlab_git_user_config'
if ! [ -t gitlab_git_user_config ]; then 
    #source <(curl -s "${DEVOPS_TOOLBOX_URL}/projects/git-user-config.sh");
fi

#
# branches stuff
#

# import 'gitlab_default_branch'
if ! [ -t gitlab_default_branch ]; then 
    #source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/default-branch.sh");
fi

# import 'gitlab_create_merge_request'
if ! [ -t gitlab_create_merge_request ]; then 
    #source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/create-merge-request.sh");
fi

# import 'gitlab_accept_merge_request'
if ! [ -t gitlab_accept_merge_request ]; then 
    #source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/accept-merge-request.sh");
fi

#
# tags stuff
#

# import 'gitlab_tag_release'
if ! [ -t gitlab_tag_release ]; then 
    #source <(curl -s "${DEVOPS_TOOLBOX_URL}/tags/tag-release.sh");
fi
