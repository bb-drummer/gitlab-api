# GitLab API

shell/bash scripting tools, functions, snippets etc. to perform GitLab API actions

## setup

```bash
source <(curl -s https://gitlab.bjoernbartels.earth/shellscripts/toolbox/raw/dev/setup.sh)
source <(curl -s https://gitlab.bjoernbartels.earth/devops/gitlab/api/raw/dev/setup.sh)
``` 


## API calls

- [`gitlab_api`](./api-url.sh#L57) : perform GitLab API call via `curl`
- [`gitlab_project_api`](./api-url.sh#L78) : perform GitLab project API call via `curl`



## project related functions

- [`gitlab_git_ssh_config`](./projects/git-ssh-config.sh) : configure (current) repository for ssh usage
- [`gitlab_git_user_config`](./projects/git-user-config.sh) : set repository's user to (current) GitLab pipeline initiator



## branch related functions

- [`gitlab_project_default_branch`](./branches/project-default-branch.sh) : retrieve default branch for GitLab project
- [`gitlab_create_merge_request`](./branches/create-merge-request.sh) : create new merge reqest in GitLab project
- [`gitlab_accespt_merge_request`](./branches/accept-merge-request.sh) : accept a merge reqest in GitLab



## tag related functions

- [`gitlab_tag_release`](./tags/tag-release.sh) : turn a tag into GitLab release


### status

please see [`dev`](https://gitlab.bjoernbartels.earth/devops/gitlab/api/tree/dev) branch for current stuff and progress

[https://gitlab.bjoernbartels.earth/devops/gitlab/api/tree/dev](https://gitlab.bjoernbartels.earth/devops/gitlab/api/tree/dev)