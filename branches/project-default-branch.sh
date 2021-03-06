#! /usr/bin/env bash

###
# get projects default branch
#
# signature:
# ```
# gitlab_get_default_branch
# ```
#
# @require CI_PROJECT_API_URL
#
# @return default_branch
# @export CI_PROJECT_DEFAUL_BRANCH
#
# @uses curl
# @uses jq
# @uses gitlab_api_project
#
###

gitlab_project_default_branch () {

    local default_branch="";

    # Look which is the default branch from project record
    default_branch=$(json_value ".default_branch" "$(gitlab_project_api)");

    export CI_PROJECT_DEFAUL_BRANCH=$default_branch
    echo $CI_PROJECT_DEFAUL_BRANCH;

}

