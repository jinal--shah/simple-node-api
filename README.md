# Simple Node App

_... code for a node-based api, along with all assets required for build-test-deploy_

>
> A request to this app's endpoint /message returns a hard-coded json payload.
>
> Exposes a /health endpoint as a basic health check.
>

* [... build](#build)
* [... run](#run)
* [... find current version](#current-version)

## BUILD

Built using `docker run` rather than `docker build`
to take advantage of volume mounts for m2 cache and
src.

## BUILD

Run `build.sh`.

The unit tests are actually run as part of the build phase.

Hey, fail fast, where-ever possible.

## RUN

Running app listens on port 5000.

Obviously when you run the app in a container, you can map to whichever host port you like.

## CURRENT VERSION

Quick, scripted way to get current version of app from pom.xml:

```bash
docker run -t --rm --name get_version-$(date +'%Y%m%d%H%M%S') \
    -w /project \
    -v $PWD:/project `# map this git repo root` \
        node:10-alpine node -p -e "require('./package.json').version"
