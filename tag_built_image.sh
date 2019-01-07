#!/bin/bash
# vim: et sr sw=4 ts=4 smartindent:

# source cfg and libs first to take advantage of common vars and funcs.
! . cfg.sh && echo >&2 "ERROR: could not source common vars file" && exit 1
! . libs.sh && echo >&2 "ERROR: could not source common libs file" && exit 1

main() {
    local tag="$1"
    local git_ref=$(git_ref)

    [[ -z "$tag" ]] && echo >&2 "ERROR: pass $(basename $0) a tag" && return 1
    [[ -z "$git_ref" ]] && echo >&2 "ERROR: could not get git ref" && return 1

    docker tag $APP:$git_ref $APP:$tag
}

main "$1"
