#! /usr/bin/env bash

if ! [ -t curl ]; then echo -e "\e[91mCommand not found: curl\e[0m"; exit 1; fi
if ! [ -t jq ]; then echo -e "\e[91mCommand not found: jq\e[0m"; exit 1; fi

gitlab_accept_merge_request () {

    # curl <gitlab-api> 'accept_merge_request' 'mr_iid'

}

