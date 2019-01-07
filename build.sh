#!/bin/bash
# vim: et sr sw=4 ts=4 smartindent:

# source cfg and libs first to take advantage of common vars and funcs.
! . cfg.sh && echo >&2 "ERROR: could not source common vars file" && exit 1
! . libs.sh && echo >&2 "ERROR: could not source common libs file" && exit 1

# ... get app version from pom.xml for potential tagging of docker image
app_version() {
    docker run -t --rm --name get_version-$(date +'%Y%m%d%H%M%S') \
        -w /project \
        -v $PROJ_ROOT_DIR:/project `# map this git repo root` \
            $NODE_IMAGE node -p -e "require('./package.json').version"
}

docker_build() {
    local git_ref="$1"
    local version="$2"
    local labels="$3"
    local rc=0
    docker build --force-rm $labels -t $APP:${git_ref} .
}

prep_env() { docker pull $NODE_IMAGE ; }

labels() {
    local version="$1"
    gu=$(git_uri) || return 1
    gs=$(git_sha) || return 1
    gb=$(git_branch) || return 1
    gt=$(git describe --exact-match --tags 2>/dev/null || echo "no-git-tag")
    bb=$(built_by | sed -e 's/ \+/_/g') || return 1

    cat<<EOM
    --label build=$(date +'%Y%m%d%H%M%S')
    --label $APP.version=$version
    --label $APP.build_git_uri=$gu
    --label $APP.build_git_sha=$gs
    --label $APP.build_git_branch=$gb
    --label $APP.build_git_tag=$gt
    --label $APP.built_by=$bb
EOM
}

main(){
    ! prep_env && echo "ERROR: unable to prep env" && return 1

    echo "BUILDING $APP app ..."
    echo "... configuring labels for docker image"
    local git_ref=$(git_ref)
    local version=$(app_version)
    local labels=$(labels $version) || return 1

    echo "VERSION: $version"
    echo "GIT REF: $git_ref"
    echo "LABELS: $labels"

    docker_build "$git_ref" "$version" "$labels" || return 1
}

main
