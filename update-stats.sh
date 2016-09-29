#!/usr/bin/env bash
source ${WORKSPACE}/.rvmrc
source ${WORKSPACE}/props.sh

set -x
files=""
# Collect the stats files
for source_file in `ls $job | grep .latency`; do
  source_file=$job/$source_file
  files="$files --file $source_file"
done

FAIL="--err $file.err"
if [ "$FAIL_ON_ERROR" = "true" ]; then
  FAIL="--fail-on-error"
fi

# create the new statistics
$stats -v --stats $file --build $build_number $files $FAIL

# add the file for upload
git add $file
