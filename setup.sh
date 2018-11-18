#! /usr/bin/env bash

# set gitlab toolbox URL
if [ -z $DEVOPS_GITLAP_API_URL ]; then
    export DEVOPS_TOOLBOX_URL="https://gitlab.bjoernbartels.earth/devops/gitlab/api/raw/dev";
fi

# import 'gitlab_api', check and/or set mandatory global variables
if [ -z $CI_PROJECT_API_URL ] || [ -t gitlab_api ]; then 
    source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/create-merge-request.sh");
fi

#
# branches stuff
#

# import 'gitlab_default_branch'
if ! [ -t gitlab_default_branch ]; then 
    source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/default-branch.sh");
fi

# import 'gitlab_create_merge_request'
if ! [ -t gitlab_create_merge_request ]; then 
    source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/create-merge-request.sh");
fi

# import 'gitlab_accept_merge_request'
if ! [ -t gitlab_accept_merge_request ]; then 
    source <(curl -s "${DEVOPS_TOOLBOX_URL}/branches/accept-merge-request.sh");
fi

#
# tags stuff
#

# import 'gitlab_tag_release'
if ! [ -t gitlab_tag_release ]; then 
    source <(curl -s "${DEVOPS_TOOLBOX_URL}/tags/tag-release.sh");
fi
