#! /usr/bin/env bash

gitlab_open_merge_requests () {

    echo $(gitlab_project_api "merge_requests?state=opened");
    
}