#!/usr/bin/env bash

# check if v8 gitmodule is empty
if [ ! "$(ls -A ./deps/v8)" ]
then
    git clone https://chromium.googlesource.com/v8/v8.git ./deps/ || exit 1
    echo "v8 gitmodule cloned"
fi

# check if depot_tools gitmodule is empty
if [ ! "$(ls -A ./deps/depot_tools)" ]
then
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git ./deps/ || exit 1
    echo "depot_tools gitmodule cloned"
fi

echo "Select v8 release tag:"
read Version
echo "Version ${Version} selected"

# current checked out version hash
HASH=$(git rev-parse --short HEAD)

# checkout v8 version in repo
cd ./deps/v8
git checkout ${Version} || exit 1

# tag docker build
cd ../..
CURRENT_PATH=$(pwd)
docker build -t v8-build:${Version} -f ${CURRENT_PATH}/.cicd/docker/build.Dockerfile ${CURRENT_PATH}