#!/usr/bin/env bash

# Fail on errors
set -e

# argument is the directory in which we are working and need to load the rmvrc file
if [ "$#" -gt 0 ]; then
    source $1/.rvmrc
fi

export aws=/usr/local/bin/aws

export job=$WORKSPACE/job
export stats=$WORKSPACE/bin/stats

# Various builds we track
export file=$WORKSPACE/data/${SOURCE_BUILD_NAME}_stats.json
export build_number=$SOURCE_BUILD_NUMBER
