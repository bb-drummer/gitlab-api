#! /usr/bin/env bash

###
# chech for API variables and define API URLs
#
# requires:
# - CI_PROJECT_ID
# - CI_PROJECT_URL
#
# exports:
# - GITLAB_API_VERSION
# - GITLAB_API_URL
# - CI_PROJECT_API_URL
#
# functions:
# - gitlab_api : cURL GitLab API
# - gitlab_project_api : cURL GitLab project API
#
###

if [ -z $CI_PROJECT_ID ]; then
    echo -e "\e[91mERROR: NO \"CI_PROJECT_ID\" defined... Sure, you are in a (GitLab) CI pipeline?!\e[0m\n";
    exit 1;
fi
if [ -z $CI_PROJECT_URL ]; then
    echo -e "\e[91mERROR: NO \"CI_PROJECT_URL\" defined... Sure, you are in a (GitLab) CI pipeline?!\e[0m\n";
    exit 1;
fi
if [ -z $GITLAB_PRIVATE_TOKEN ]; then
    echo -e "\e[91mERROR: NO \"GITLAB_PRIVATE_TOKEN\" defined... GITLAB_PRIVATE_TOKEN must contain a GitLab private access token!\e[0m\n";
    exit 1;
fi

if [ -z $GITLAB_API_VERSION ]; then 

    export GITLAB_API_VERSION="v4"; 
    echo -e "Setting GitLab API version: \e[96m${GITLAB_API_VERSION}\e[0m\n";

fi

if [[ $CI_PROJECT_URL =~ ^https?://[^/]+ ]] && [ -z $GITLAB_API_URL ]; then 

    export GITLAB_API_URL="${BASH_REMATCH[0]}/api/${GITLAB_API_VERSION}/";
    echo -e "\e[96mSetting GitLab API URL: \e[96m${GITLAB_API_URL}\e[0m\n";

fi

if [ -z $CI_PROJECT_API_URL ]; then 

    export CI_PROJECT_API_URL="${GITLAB_API_URL}projects/${CI_PROJECT_ID}/";
    echo -e "\e[96mSetting GitLab project API URL: \e[96m${CI_PROJECT_API_URL}\e[0m\n";

fi

if ! [ -t gitlab_api ]; then

    # ```bash
    # result=`gitlab_api '<api-command>' ['<curl-parameters...>']`
    # ```
    gitlab_api () {
        
        local httpmessage
        declare -A responseHeader

        httpmessage=$(curl -i -L --silent "${GITLAB_API_URL}/$1" --header "PRIVATE-TOKEN:${GITLAB_PRIVATE_TOKEN}" ${@:2:99});
        
        http_header_body responseHeader responseBody "${httpmessage}"

        echo "response header: ${responseHeader[Status]}";
        
        if ! [ "${responseHeader[Status]}" == "200" ]; then
            echo -e "\e[91mERROR: GitLab API call failed...\n\n${httpmessage}\e[0m\n";
            #exit 1;
        fi

        echo ${responseBody};
    }

fi

if ! [ -t gitlab_project_api ]; then

    # ```bash
    # result=`gitlab_project_api '<api-command>' ['<curl-parameters...>']`
    # ```
    gitlab_project_api () {
        
        local httpmessage
        httpmessage=$(curl -i -L --silent "${CI_PROJECT_API_URL}/$1" --header "PRIVATE-TOKEN:${GITLAB_PRIVATE_TOKEN}" ${@:2:99});
        
        http_header_body responseHeader responseBody "${httpmessage}"

        echo "response header: ${responseHeader[Status]}";

        if ! [ "${responseHeader[Status]}" == "200" ]; then
            echo -e "\e[91mERROR: GitLab project API call failed...\n\n${httpmessage}\e[0m\n";
            #exit 1;
        fi

        echo ${responseBody};
    }

fi