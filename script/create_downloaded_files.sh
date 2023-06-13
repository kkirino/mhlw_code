#!/bin/bash
#
# create_file_paths
#

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=$(dirname ${SCRIPT_DIR})
DOCUMENT_DIR=${ROOT_DIR}/document

echo 'DOWNLOADED_FILES = \'
cat document/urls  |
xargs -n1 basename |
awk -v nrow=$(cat document/urls | wc -l) '{
if (NR!=nrow) {
    print "downloaded/"$0" \\"
} else {
    print "downloaded/"$0}
}'




