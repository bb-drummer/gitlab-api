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

gitlab_get_default_branch () {

    local default_branch="";

    # Look which is the default branch
    default_branch=`gitlab_api_project | jq --raw-output '.default_branch'`;

    export CI_PROJECT_DEFAUL_BRANCH=$default_branch
    echo $CI_PROJECT_DEFAUL_BRANCH;

}

