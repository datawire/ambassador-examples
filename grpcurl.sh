#!/usr/bin/env bash

PROGRAM="$(basename $0)"
IMAGE="quay.io/datawire/grpcurl"
VERSION="latest"

docker run \
  --interactive \
  --tty \
  --rm \
  --network host \
  --volume $(pwd):/home/user/work:ro \
  --workdir /home/user/work \
  -e "COMMAND=${COMMAND}" \
  -e HOST_USER_ID=$(id -u) \
  "$IMAGE:$VERSION" "$@"