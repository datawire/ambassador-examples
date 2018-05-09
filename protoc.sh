#!/usr/bin/env bash

IMAGE="znly/protoc"
VERSION="latest"

docker run \
  --interactive \
  --tty \
  --rm \
  --network host \
  --volume $(pwd):/home/user/work:rw \
  --workdir /home/user/work \
  -e "COMMAND=${COMMAND}" \
  -e HOST_USER_ID=$(id -u) \
  "$IMAGE:$VERSION" "$@"
