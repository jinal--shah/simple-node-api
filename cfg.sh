# vim: et sr sw=2 ts=2 smartindent:
#
# This file should remain at project root.
#
# ... common cfg vals
#
APP="simple-node-api"

# ... either user defined, or defaults to dir with this file in it.
PROJ_ROOT_DIR="${PROJ_ROOT_DIR:-$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )}"

GIT_SHA_LEN="8" # preferred length of git sha1s
GIT="git --no-pager"

NODE_IMAGE="node:10-alpine"
